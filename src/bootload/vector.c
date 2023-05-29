#include "defines.h"

extern void start(void);

/*
 * 割込ベクタの設定
 * リンカ・スクリプトの定義により、先頭番地に配置される
 */
void (*vectors[])(void) = {
    start, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
};
