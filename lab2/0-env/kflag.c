#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/proc_fs.h>
#include<linux/sched.h>
#include <asm/uaccess.h>
#include <linux/slab.h>

int len,temp;

char *msg;

ssize_t read_proc(struct file *filp,char *buf,size_t count,loff_t *offp ) 
{
    if(count>temp)
    {
        count=temp;
    }
    temp=temp-count;
    copy_to_user(buf,msg, count);
    if(count==0)
    temp=len;
   
    return count;
}

ssize_t write_proc(struct file *filp,const char *buf,size_t count,loff_t *offp)
{
copy_from_user(msg,buf,count);
len=count;
temp=len;
return count;
}

static const struct file_operations proc_fops = {
read: read_proc,
write: write_proc
};
void create_new_proc_entry(void) 
{
proc_create("flag",0777,NULL,&proc_fops);
msg=kmalloc(2048*sizeof(char),GFP_KERNEL);
}


static int __init proc_init (void) {
 create_new_proc_entry();
 return 0;
}

static void __exit proc_cleanup(void) {
//	kfree(msg);
printk(KERN_INFO "proc_cleanup called\n");
 remove_proc_entry("flag",NULL);
}

MODULE_LICENSE("GPL"); 
module_init(proc_init);
module_exit(proc_cleanup);
