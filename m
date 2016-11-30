Return-Path: Nikolai.Kosjar@qt.io
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50113.outbound.protection.outlook.com [40.107.5.113])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f76e7f7b
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Nov 2016 08:36:42 +0000 (UTC)
Subject: Re: [Qt-creator] Qt Creator for Linux Kernel Development
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
 <1566601479887120@web23m.yandex.ru>
 <CAHmME9qbUuRHAMOrd82BOnr3KC9zJqGCpkN9PY1brwkR5gM84w@mail.gmail.com>
 <736bee70-7a99-8681-a976-f6fdb4e524a0@qt.io>
 <CAHmME9pRtf+qxzhxUs88JB3A-NeQNwQBNRsB0BzvWYvUEQnbjA@mail.gmail.com>
From: Nikolai Kosjar <nikolai.kosjar@qt.io>
Message-ID: <02dd2507-2627-e8a5-e4ef-cfdbf9925611@qt.io>
Date: Wed, 30 Nov 2016 09:41:08 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9pRtf+qxzhxUs88JB3A-NeQNwQBNRsB0BzvWYvUEQnbjA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Return-Path: nikolai.kosjar@qt.io
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

On 11/29/2016 08:23 PM, Jason A. Donenfeld wrote:
> Hi Nikolai,
>
> On Tue, Nov 29, 2016 at 9:55 AM, Nikolai Kosjar <nikolai.kosjar@qt.io> wrote:
>> Should work with the Clang Code Model, Qt Creator from the current 4.2
>> branch.
>>
>> The corresponding report was
>> https://bugreports.qt.io/browse/QTCREATORBUG-15590.
>
>
> Okay, in that case, I'll wait until 4.2 for it. One question:
> PRECOMPILED_HEADER -- will this take a list, or only a single value?

Providing a list, the code model gets a list :)

Nikolai
