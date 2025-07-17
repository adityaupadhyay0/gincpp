#include "server.hpp"
#include <functional>

Server::Server(const std::string& address, unsigned short port, std::size_t thread_pool_size)
    : thread_pool_size_(thread_pool_size),
      signals_(io_context_),
      acceptor_(io_context_) {
    signals_.add(SIGINT);
    signals_.add(SIGTERM);
#if defined(SIGQUIT)
    signals_.add(SIGQUIT);
#endif // defined(SIGQUIT)

    asio::ip::tcp::endpoint endpoint(asio::ip::make_address(address), port);
    acceptor_.open(endpoint.protocol());
    acceptor_.set_option(asio::ip::tcp::acceptor::reuse_address(true));
    acceptor_.bind(endpoint);
    acceptor_.listen();

    do_accept();
}

void Server::start() {
    for (std::size_t i = 0; i < thread_pool_size_; ++i) {
        threads_.emplace_back([this]() { io_context_.run(); });
    }
}

void Server::stop() {
    io_context_.stop();
    for (auto& t : threads_) {
        t.join();
    }
}

void Server::run() {
    io_context_.run();
}

void Server::do_accept() {
    acceptor_.async_accept(
        [this](std::error_code ec, asio::ip::tcp::socket socket) {
            if (!acceptor_.is_open()) {
                return;
            }

            if (!ec) {
                // TODO: Handle connection
            }

            do_accept();
        });
}
