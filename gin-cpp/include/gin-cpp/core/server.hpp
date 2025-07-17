#ifndef SERVER_HPP
#define SERVER_HPP

#include <asio.hpp>
#include <string>
#include <vector>
#include <memory>
#include <thread>

class Server {
public:
    Server(const std::string& address, unsigned short port, std::size_t thread_pool_size);
    void start();
    void stop();

private:
    void run();
    void do_accept();

    asio::io_context io_context_;
    asio::signal_set signals_;
    asio::ip::tcp::acceptor acceptor_;
    std::vector<std::thread> threads_;
    std::size_t thread_pool_size_;
};

#endif // SERVER_HPP
