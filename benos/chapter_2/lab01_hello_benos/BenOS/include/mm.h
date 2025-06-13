#ifndef	_MM_H
#define	_MM_H

#define PAGE_SHIFT	 		12
#define TABLE_SHIFT 			9
#define SECTION_SHIFT			(PAGE_SHIFT + TABLE_SHIFT)

#define PAGE_SIZE   			(1 << PAGE_SHIFT)	
#define SECTION_SIZE			(1 << SECTION_SHIFT)	

#define LOW_MEMORY              	(2 * SECTION_SIZE)

#ifndef __ASSEMBLER__

void memzero(unsigned long src, unsigned long n);
void memcpy(void *src, void *dst, int len);
void* memset(void *src, int c, int len);
void chat3(void);

#endif

#endif  /*_MM_H */
