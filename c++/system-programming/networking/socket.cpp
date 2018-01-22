#include <iostream>
#include <sys/socket.h>

int main() {
  // socket file descriptor
  int sockfd = 0;
  sockfd = socket(AF_INET, SOCK_STREAM, 0);

  // -1 is creation error
  if (sockfd == -1) {
    std::cout << "can't create the socket" << '\n';
  }
}
