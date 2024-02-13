#include <windows.h>
#include "UGE.h"

int APIENTRY wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPWSTR lpCmdLine, int nCmdShow) {
  UGE app(lpCmdLine);
  app.Run();
}