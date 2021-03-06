// compile:
//   clang++ -std=c++14 show_img.cpp -lopencv_core -lopencv_highgui
//   -lopencv_imgcodecs
#include <iostream>
#include <opencv2/opencv.hpp>

int main(int argc, char **argv) {
  // read image from argument
  cv::Mat img = cv::imread(argv[1], -1);
  if (img.empty()) {
    std::cout << "Don't have this image" << std::endl;
    return -1; // exit with signal 1
  }
  // Create a window
  cv::namedWindow("Show Image", cv::WINDOW_AUTOSIZE);
  // Show image on window, detected by ref name
  cv::imshow("Show Image", img);
  // Wait a keyboard's input
  cv::waitKey(0);
  // Destroy the window by ref name
  cv::destroyWindow("Show Image");
}
