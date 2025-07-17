#include "http_response.hpp"
#include <vector>
#include <asio.hpp>

namespace MimeType {
    std::string from_extension(const std::string& ext) {
        if (ext == "html" || ext == "htm") return TEXT_HTML;
        if (ext == "css") return "text/css";
        if (ext == "js") return "application/javascript";
        if (ext == "json") return APPLICATION_JSON;
        if (ext == "xml") return APPLICATION_XML;
        if (ext == "jpg" || ext == "jpeg") return "image/jpeg";
        if (ext == "png") return "image/png";
        if (ext == "gif") return "image/gif";
        return APPLICATION_OCTET_STREAM;
    }

    std::string charset_utf8(const std::string& mime_type) {
        return mime_type + "; charset=utf-8";
    }
}

namespace HttpStatus {
    std::string reason_phrase(int code) {
        switch (code) {
            case OK: return "OK";
            case CREATED: return "Created";
            case ACCEPTED: return "Accepted";
            case NO_CONTENT: return "No Content";
            case MOVED_PERMANENTLY: return "Moved Permanently";
            case FOUND: return "Found";
            case NOT_MODIFIED: return "Not Modified";
            case TEMPORARY_REDIRECT: return "Temporary Redirect";
            case PERMANENT_REDIRECT: return "Permanent Redirect";
            case BAD_REQUEST: return "Bad Request";
            case UNAUTHORIZED: return "Unauthorized";
            case FORBIDDEN: return "Forbidden";
            case NOT_FOUND: return "Not Found";
            case METHOD_NOT_ALLOWED: return "Method Not Allowed";
            case CONFLICT: return "Conflict";
            case UNPROCESSABLE_ENTITY: return "Unprocessable Entity";
            case TOO_MANY_REQUESTS: return "Too Many Requests";
            case INTERNAL_SERVER_ERROR: return "Internal Server Error";
            case NOT_IMPLEMENTED: return "Not Implemented";
            case BAD_GATEWAY: return "Bad Gateway";
            case SERVICE_UNAVAILABLE: return "Service Unavailable";
            case GATEWAY_TIMEOUT: return "Gateway Timeout";
            default: return "Unknown";
        }
    }

    bool is_success(int code) { return code >= 200 && code < 300; }
    bool is_redirect(int code) { return code >= 300 && code < 400; }
    bool is_client_error(int code) { return code >= 400 && code < 500; }
    bool is_server_error(int code) { return code >= 500 && code < 600; }
}

HttpResponse& HttpResponse::status(int code) {
    status_code_ = code;
    return *this;
}

HttpResponse& HttpResponse::header(const std::string& key, const std::string& value) {
    headers_.set(key, value);
    return *this;
}

HttpResponse& HttpResponse::headers(const std::unordered_map<std::string, std::string>& hdrs) {
    for (const auto& [key, value] : hdrs) {
        headers_.set(key, value);
    }
    return *this;
}

std::string HttpResponse::get_header(const std::string& key) const {
    return headers_.get(key);
}

bool HttpResponse::has_header(const std::string& key) const {
    return headers_.has(key);
}

HttpResponse& HttpResponse::body(const std::string& content) {
    body_ = content;
    return *this;
}

HttpResponse& HttpResponse::body(const std::vector<uint8_t>& data) {
    body_ = std::string(data.begin(), data.end());
    return *this;
}

HttpResponse& HttpResponse::append(const std::string& content) {
    body_ += content;
    return *this;
}

HttpResponse& HttpResponse::json(const std::string& json_content) {
    header("Content-Type", "application/json; charset=utf-8");
    body(json_content);
    return *this;
}

HttpResponse& HttpResponse::html(const std::string& html_content) {
    header("Content-Type", "text/html; charset=utf-8");
    body(html_content);
    return *this;
}

HttpResponse& HttpResponse::text(const std::string& text_content) {
    header("Content-Type", "text/plain; charset=utf-8");
    body(text_content);
    return *this;
}

HttpResponse& HttpResponse::redirect(const std::string& location, int code) {
    status(code);
    header("Location", location);
    return *this;
}

HttpResponse& HttpResponse::cookie(const std::string& name, const std::string& value, const std::string& options) {
    std::string cookie_header = name + "=" + value;
    if (!options.empty()) {
        cookie_header += "; " + options;
    }
    header("Set-Cookie", cookie_header);
    return *this;
}

std::string format_http_date(std::time_t t) {
    std::tm* ptm = std::gmtime(&t);
    char buf[32];
    std::strftime(buf, sizeof(buf), "%a, %d %b %Y %H:%M:%S GMT", ptm);
    return buf;
}

std::string HttpResponse::serialize() const {
    std::ostringstream oss;

    // Status line
    oss << "HTTP/1.1 " << status_code_ << " "
        << HttpStatus::reason_phrase(status_code_) << "\r\n";

    // Headers
    auto headers = headers_.get_data();

    // Ensure essential headers
    if (!headers_.has("Content-Type")) {
        headers["content-type"] = "text/plain";
    }
    if (!headers_.has("Content-Length")) {
        headers["content-length"] = std::to_string(body_.size());
    }
    if (!headers_.has("Connection")) {
        headers["connection"] = "keep-alive";
    }
    if (!headers_.has("Date")) {
        headers["date"] = format_http_date(std::time(nullptr));
    }
    if (!headers_.has("Server")) {
        headers["server"] = "GinCpp/1.0";
    }

    // Write headers
    for (const auto& [key, value] : headers) {
        oss << key << ": " << value << "\r\n";
    }

    // Empty line + body
    oss << "\r\n" << body_;

    return oss.str();
}

std::vector<uint8_t> HttpResponse::serialize_binary() const {
    std::string str = serialize();
    return std::vector<uint8_t>(str.begin(), str.end());
}

size_t HttpResponse::content_length() const {
    return body_.size();
}
