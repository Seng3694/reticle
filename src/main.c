#include <raylib.h>

int main(void) {
  const int windowSize = 32;
  const int halfWindowSize = windowSize / 2;

  SetConfigFlags(FLAG_WINDOW_TRANSPARENT | FLAG_WINDOW_UNDECORATED |
                 FLAG_WINDOW_TOPMOST | FLAG_WINDOW_MOUSE_PASSTHROUGH |
                 FLAG_WINDOW_UNFOCUSED);
  InitWindow(windowSize, windowSize, "reticle");
  SetTargetFPS(1);

  while (!WindowShouldClose()) {
    BeginDrawing();
    ClearBackground(BLANK);
    DrawRectangle(0, halfWindowSize - 1, windowSize, 2, WHITE);
    DrawRectangle(halfWindowSize - 1, 0, 2, windowSize, WHITE);
    EndDrawing();
  }

  CloseWindow();
  return 0;
}