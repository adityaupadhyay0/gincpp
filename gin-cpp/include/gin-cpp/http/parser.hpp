#ifndef REQUEST_PARSER_HPP
#define REQUEST_PARSER_HPP

#include <string>
#include <vector>

struct Request {
    std::string method;
    std::string uri;
    int http_version_major;
    int http_version_minor;
    std::vector<std::pair<std::string, std::string>> headers;
    std::string body;
};

class RequestParser {
public:
    enum ResultType { GOOD, BAD, INDETERMINATE };
    template <typename InputIterator>
    ResultType parse(Request& req, InputIterator begin, InputIterator end);
};

#endif // REQUEST_PARSER_HPP
