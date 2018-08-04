Return-Path: john@mib-infotech.co.nz
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac415891
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 22:05:54 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1543fcc
 for <wireguard@lists.zx2c4.com>; Sat, 4 Aug 2018 22:05:54 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id d17-v6so4466534pgv.10
 for <wireguard@lists.zx2c4.com>; Sat, 04 Aug 2018 15:16:32 -0700 (PDT)
Return-Path: <john@mib-infotech.co.nz>
Subject: Re: package seems to have lost netifrc script
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <55706f46-74db-9dfb-6cc7-93ce40f0d5c5@mib-infotech.co.nz>
 <CAHmME9p-GMKAt-c=w4HdRMEDE0RbY6ok84uSCdQ6pqmD6_DyCA@mail.gmail.com>
From: John Huttley <john@mib-infotech.co.nz>
Message-ID: <1a96593c-5954-ee6a-7f74-3ed34302735b@mib-infotech.co.nz>
Date: Sun, 5 Aug 2018 10:16:21 +1200
MIME-Version: 1.0
In-Reply-To: <CAHmME9p-GMKAt-c=w4HdRMEDE0RbY6ok84uSCdQ6pqmD6_DyCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I'm running default  stable netifrc-0.5.1. I guess this is in the 0.6.X 
series.. (~amd64)

I'll keep running stable thanks and copy the script as required.

Thanks,

john


On 05/08/18 10:08, Jason A. Donenfeld wrote:
> On Sun, Aug 5, 2018 at 12:07 AM John Huttley <john@mib-infotech.co.nz> wrote:
>> Gentoo needs a script in /lib/netifrc/net  for network integration with
>> openrc.
>>
>>
>> This exists in wireguard-0.0.20180625 not in wireguard-0.0.20180802  or git.
>>
>> The package is built with "module tools".
>>
>> What happened?
> It's now part of the netifrc scripts that come by default!
