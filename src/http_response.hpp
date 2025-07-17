#ifndef HTTP_RESPONSE_HPP
#define HTTP_RESPONSE_HPP

#include <string>
#include <vector>
#include <unordered_map>
#include <algorithm>
#include <cctype>
#include <sstream>
#include <ctime>

namespace MimeType {
    constexpr const char* TEXT_PLAIN = "text/plain";
    constexpr const char* TEXT_HTML = "text/html";
    constexpr const char* APPLICATION_JSON = "application/json";
    constexpr const char* APPLICATION_XML = "application/xml";
    constexpr const char* APPLICATION_OCTET_STREAM = "application/octet-stream";
    constexpr const char* MULTIPART_FORM_DATA = "multipart/form-data";
    constexpr const char* APPLICATION_FORM_URLENCODED = "application/x-www-form-urlencoded";

    std::string from_extension(const std::string& ext);
    std::string charset_utf8(const std::string& mime_type);
}

namespace HttpStatus {
    // 2xx Success
    constexpr int OK = 200;
    constexpr int CREATED = 201;
    constexpr int ACCEPTED = 202;
    constexpr int NO_CONTENT = 204;

    // 3xx Redirection
    constexpr int MOVED_PERMANENTLY = 301;
    constexpr int FOUND = 302;
    constexpr int NOT_MODIFIED = 304;
    constexpr int TEMPORARY_REDIRECT = 307;
    constexpr int PERMANENT_REDIRECT = 308;

    // 4xx Client Error
    constexpr int BAD_REQUEST = 400;
    constexpr int UNAUTHORIZED = 401;
    constexpr int FORBIDDEN = 403;
    constexpr int NOT_FOUND = 404;
    constexpr int METHOD_NOT_ALLOWED = 405;
    constexpr int CONFLICT = 409;
    constexpr int UNPROCESSABLE_ENTITY = 422;
    constexpr int TOO_MANY_REQUESTS = 429;

    // 5xx Server Error
    constexpr int INTERNAL_SERVER_ERROR = 500;
    constexpr int NOT_IMPLEMENTED = 501;
    constexpr int BAD_GATEWAY = 502;
    constexpr int SERVICE_UNAVAILABLE = 503;
    constexpr int GATEWAY_TIMEOUT = 504;

    std::string reason_phrase(int code);
    bool is_success(int code);
    bool is_redirect(int code);
    bool is_client_error(int code);
    bool is_server_error(int code);
}

class CaseInsensitiveMap {
private:
    std::unordered_map<std::string, std::string> data_;

    std::string to_lower(const std::string& str) const {
        std::string result = str;
        std::transform(result.begin(), result.end(), result.begin(), ::tolower);
        return result;
    }

public:
    void set(const std::string& key, const std::string& value) {
        data_[to_lower(key)] = value;
    }

    std::string get(const std::string& key) const {
        auto it = data_.find(to_lower(key));
        return it != data_.end() ? it->second : "";
    }

    bool has(const std::string& key) const {
        return data_.find(to_lower(key)) != data_.end();
    }

    const std::unordered_map<std::string, std::string>& get_data() const {
        return data_;
    }
};

class HttpResponse {
private:
    int status_code_ = 200;
    CaseInsensitiveMap headers_;
    std::string body_;
    bool headers_sent_ = false;

public:
    // Status management
    HttpResponse& status(int code);
    int get_status() const { return status_code_; }

    // Header management (case-insensitive)
    HttpResponse& header(const std::string& key, const std::string& value);
    HttpResponse& headers(const std::unordered_map<std::string, std::string>& hdrs);
    std::string get_header(const std::string& key) const;
    bool has_header(const std::string& key) const;

    // Body management
    HttpResponse& body(const std::string& content);
    HttpResponse& body(const std::vector<uint8_t>& data);
    HttpResponse& append(const std::string& content);

    // Convenience methods
    HttpResponse& json(const std::string& json_content);
    HttpResponse& html(const std::string& html_content);
    HttpResponse& text(const std::string& text_content);
    HttpResponse& redirect(const std::string& location, int code = 302);
    HttpResponse& cookie(const std::string& name, const std::string& value,
                        const std::string& options = "");

    // Serialization
    std::string serialize() const;
    std::vector<uint8_t> serialize_binary() const;
    size_t content_length() const;

    // State management
    bool is_sent() const { return headers_sent_; }
    void mark_sent() { headers_sent_ = true; }
};

#endif // HTTP_RESPONSE_HPP
