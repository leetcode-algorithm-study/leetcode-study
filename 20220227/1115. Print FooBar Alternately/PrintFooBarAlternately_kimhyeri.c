typedef struct {
    sem_t fsemaphore; // fsema 세마포어 생성
    sem_t bsemaphore;
    int n;
} FooBar;

// sem_init에
// 첫번째 인자: 세마포어 객체를 초기화 할 세마포어를 받는다.
// 두번째 인자: 여기에 0을 줘야함 아님 ENOSYS 에러코드 반환
// 세번째 인자: 세마포어를 몇으로 초기화 할지
FooBar* fooBarCreate(int n) {
    FooBar* obj = (FooBar*) malloc(sizeof(FooBar));
    sem_init(&obj->fsemaphore, 0, 1);
    sem_init(&obj->bsemaphore, 0, 0);
    obj->n = n;
    return obj;
}

// wait: 세마포어의 p 역할
// 세마포어를 하나 감소시키는 역할을 하고 세마포어가 0일 경우에는 1 이상이 될 때까지 스레드는 대기 상태에 있는다.
// 0이 아닐 경우에는 대기상태에서 빠져나와 세마포어를 또 1 감소시킨다.

// post: 세마포어의 v 역할
// 세마포어 값을 1 증가 시킨다.
void foo(FooBar* obj) {
    for (int i = 0; i < obj->n; i++) {
        sem_wait(&obj->fsemaphore);
        printFoo();
        sem_post(&obj->bsemaphore);
    }
}

void bar(FooBar* obj) {
    for (int i = 0; i < obj->n; i++) {
        sem_wait(&obj->bsemaphore);
        printBar();
        sem_post(&obj->fsemaphore);
    }
}

// 세마포어와 관련된 리소스들을 전부 소멸시킴
// 객체 소멸
void fooBarFree(FooBar* obj) {
    sem_destroy(&obj->fsemaphore);
    sem_destroy(&obj->bsemaphore);
    free(obj);
}
