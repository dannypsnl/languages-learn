#include <iostream>
#include <opencv2/opencv.hpp>

int main(int argc, char **argv) {
  // read image from argument
  cv::Mat img = cv::imread(argv[1], -1);
  if (img.empty()) {
    std::cout << "Don't have this image" << std::endl;
    return -1; // exit with signal 1
  }
}
