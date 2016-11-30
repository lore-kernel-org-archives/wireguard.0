Return-Path: orgads@gmail.com
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a1824f7
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Nov 2016 08:39:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g23so28282052wme.1
 for <wireguard@lists.zx2c4.com>; Wed, 30 Nov 2016 00:43:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <736bee70-7a99-8681-a976-f6fdb4e524a0@qt.io>
References: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
 <1566601479887120@web23m.yandex.ru>
 <CAHmME9qbUuRHAMOrd82BOnr3KC9zJqGCpkN9PY1brwkR5gM84w@mail.gmail.com>
 <736bee70-7a99-8681-a976-f6fdb4e524a0@qt.io>
From: Orgad Shaneh <orgads@gmail.com>
Date: Wed, 30 Nov 2016 10:43:55 +0200
Message-ID: <CAGHpTBLc8Hw1kYmKX0Z1PCH5pNSd8t=jMN1h4TE1dMEy5+bNDA@mail.gmail.com>
Subject: Re: [Qt-creator] Qt Creator for Linux Kernel Development
To: Nikolai Kosjar <nikolai.kosjar@qt.io>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "qt-creator@qt-project.org" <qt-creator@qt-project.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 29, 2016 at 10:55 AM, Nikolai Kosjar <nikolai.kosjar@qt.io> wrote:
> On 11/28/2016 07:03 PM, Jason A. Donenfeld wrote:
>>
>> On Wed, Nov 23, 2016 at 8:45 AM, Konstantin Tokarev <annulen@yandex.ru>
>> wrote:
>>>
>>> You can set PRECOMPILED_HEADER = header.h in your pro file. It should be
>>> applied to all sources.
>>
>>
>> Nope, that's certainly not what that field does.
>
>
> Should work with the Clang Code Model, Qt Creator from the current 4.2
> branch.
>
> The corresponding report was
> https://bugreports.qt.io/browse/QTCREATORBUG-15590.

It should also work with the built-in code model. Not sure why Jason
claimed it doesn't. Did you try it?

- Orgad
