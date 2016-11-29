Return-Path: Nikolai.Kosjar@qt.io
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0124.outbound.protection.outlook.com [104.47.0.124])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a624e9e
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 08:51:42 +0000 (UTC)
Subject: Re: [Qt-creator] Qt Creator for Linux Kernel Development
To: Konstantin Tokarev <annulen@yandex.ru>, "Jason A. Donenfeld"
 <jason@zx2c4.com>, "qt-creator@qt-project.org" <qt-creator@qt-project.org>
References: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
 <1566601479887120@web23m.yandex.ru>
From: Nikolai Kosjar <nikolai.kosjar@qt.io>
Message-ID: <07fd30ec-41fc-6dc4-fb12-14b591ef1b0c@qt.io>
Date: Tue, 29 Nov 2016 09:56:00 +0100
MIME-Version: 1.0
In-Reply-To: <1566601479887120@web23m.yandex.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Return-Path: nikolai.kosjar@qt.io
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 11/23/2016 08:45 AM, Konstantin Tokarev wrote:
> 23.11.2016, 08:51, "Jason A. Donenfeld" <jason@zx2c4.com>:
>> Hello Eike & Qt Creator mailing list,
>>
>> I'm insane and decided to try using an IDE for Linux kernel
>> development. Much to my delight, it actually works well. (Everybody on
>> the mailing list to which this message is cross-posted just vomited a
>> little bit in their mouth and swallowed, but fear not: I'm a competent
>> VIM user too. It's just that sometimes clickity clicking around Qt
>> Creator is buttery nice. Here's a screenshot [2].)
>>
>> I'm working on a small kernel module [1], and for it I made a very
>> minimal .pro file to import its files into Qt Creator. I even hooked
>> the build/run commands up to my qemu testing rig. Seems to work pretty
>> well. Here's the .pro I use:
>>
>> CONFIG -= qt
>> INCLUDEPATH = /usr/src/linux/arch/x86/include
>> /usr/src/linux/arch/x86/include/generated/uapi /usr/src/linux/
>> arch/x86/include/generated /usr/src/linux/include
>> /usr/src/linux/arch/x86/include/uapi /usr/src/linux/arch/x
>> 86/include/generated/uapi /usr/src/linux/include/uapi
>> /usr/src/linux/include/generated/uapi
>> DEFINES = __KERNEL__ DEBUG MODULE
>> SOURCES = $$system(find -L . -type f -iname $$system_quote(*.c) -and
>> -not -path $$system_quote(./tests/*)) $
>> $system(find -L . -type f -iname $$system_quote(*.S) -and -not -path
>> $$system_quote(./tests/*))
>> HEADERS = $$system(find -L . -type f -iname $$system_quote(*.h) -and
>> -not -path $$system_quote(./tests/*))
>>
>> As you can see, it's a real hack.
>>
>> I also do development on the main Linux kernel tree, and similarly for
>> that, I have a .pro file that works well:
>>
>> CONFIG -= qt
>> INCLUDEPATH = $$system(find -L include/ -type d)
>> SOURCES = $$system(find -L . -type f -iname \'*.c\')
>> HEADERS = $$system(find -L . -type f -iname \'*.h\')
>> INCLUDEPATH = include/ arch/x86/include
>>
>> Download the linux sources, put that in the tree, and load it up in Qt
>> Creator. It works. Amazing!
>>
>> But don't get too excited. Unfortunately, there are two issues that
>> make things unbearable:
>>
>> (A) Qt Creator doesn't seem to parse the C correctly. Things like
>> designated initializers and a few other C features here and there just
>> don't get parsed correctly, and the IDE stops being useful. I suspect
>> this is because things are actually being parsed in C++ mode. Bummer.
>> Developers: any interest in improving C support in Qt Creator?
>>
>> (B) There is no way to tell Qt Creator that a particular header file
>> is included in every file -- that is, that gcc's "-include" is in use.
>> There is a way of messing with the "C++ Code Model" on a file-by-file
>> basis, for the duration of the time that the file is open, but no way
>> to automatically have it included in every file of the project. This
>> is a major hindrance. It means that every ifdef for every kconfig
>> option is a grayed out unclickable region, rendering most things
>> useless.
>
> BTW, I'm facing similar issue with QtWebKit: config.h is included into all
> source files, but never in headers, so all #if's in headers are disabled
> and code model does not function properly.

Could you provide a report for this with a minimal example?

Nikolai
