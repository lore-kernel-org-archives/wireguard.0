Return-Path: Nikolai.Kosjar@qt.io
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30106.outbound.protection.outlook.com [40.107.3.106])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a432481c
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Nov 2016 08:51:13 +0000 (UTC)
Subject: Re: [Qt-creator] Qt Creator for Linux Kernel Development
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "qt-creator@qt-project.org"
 <qt-creator@qt-project.org>
References: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
 <1566601479887120@web23m.yandex.ru>
 <CAHmME9qbUuRHAMOrd82BOnr3KC9zJqGCpkN9PY1brwkR5gM84w@mail.gmail.com>
From: Nikolai Kosjar <nikolai.kosjar@qt.io>
Message-ID: <736bee70-7a99-8681-a976-f6fdb4e524a0@qt.io>
Date: Tue, 29 Nov 2016 09:55:31 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9qbUuRHAMOrd82BOnr3KC9zJqGCpkN9PY1brwkR5gM84w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
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

On 11/28/2016 07:03 PM, Jason A. Donenfeld wrote:
> On Wed, Nov 23, 2016 at 8:45 AM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>> You can set PRECOMPILED_HEADER = header.h in your pro file. It should be
>> applied to all sources.
>
> Nope, that's certainly not what that field does.

Should work with the Clang Code Model, Qt Creator from the current 4.2 
branch.

The corresponding report was 
https://bugreports.qt.io/browse/QTCREATORBUG-15590.

Nikolai
