#ifndef COMMON_CONFIG_H
#define COMMON_CONFIG_H

#if defined(__alpha) || defined(_M_X64) || defined(__x86_64__)
	#define Platform_64bit
#else
	#define Platform_32bit
#endif /* Word length switch */

#if defined(_WIN32) /* Defined for both 32-bit and 64-bit environments */
	#define Platform_Windows
#elif defined(__linux__)
	#define Platform_Linux
#elif defined(__APPLE__) && defined(__MACH__)
	#define Platform_Mac
#elif defined(sun) || defined(__sun)
        #define Platform_Solaris
#endif /* OS switch */

/* see http://sourceforge.net/apps/mediawiki/predef/index.php?title=Architectures */
#if defined(__alpha) ||  defined(i386) || defined(__i386) || defined(_M_IX86) || defined(__x86__) || defined(_M_X64) || defined(__x86_64__)
	#define Platform_LittleEndian
#else
	#define Platform_BigEndian
#endif

#endif /* COMMON_CONFIG_H */
