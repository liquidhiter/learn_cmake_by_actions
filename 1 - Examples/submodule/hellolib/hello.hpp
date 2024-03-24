#pragma once

/* =============================== Structs =============================== */
typedef struct {
    void (*func)(const char*);
} HelloFun_S;

/* =============================== Prototypes ============================= */
void PrintHello(const char* argv);