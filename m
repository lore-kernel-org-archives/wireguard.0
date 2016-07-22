Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab3f4894
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 23:13:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97ab7855
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 23:13:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d2434b43
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 23:13:34 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id l69so94849659lfg.1
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jul 2016 16:15:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87oa5pl19b.fsf@alice.fifthhorseman.net>
References: <87bn1pmjda.fsf@alice.fifthhorseman.net>
 <87oa5pl19b.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 23 Jul 2016 01:15:37 +0200
Message-ID: <CAHmME9o3rvZVyGoBZZZ_j46GUg81sYrFZktcnVJa=xVvTGdN0Q@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] new build process doesn't work with debian's dkms
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Jul 23, 2016 at 1:08 AM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> On Fri 2016-07-22 17:51:45 -0400, Daniel Kahn Gillmor wrote:
>
>> i'm trying to package wireguard experimental-0.0.20160722 for debian, and it looks
>> like the new Kconfig/Kbuild/Makefile revamp from
>> 3106d632de4235f8c6d63d602fe2fa9e0175d690 causes the version of dkms to
>> not be able to build it automagically.
>
> uh, please chalk this up to lack of sleep and general delirium, it's all
> working fine when i remember to actually ship Kconfig and Kbuild :)

Glad to hear. I figured it was something like that :P.
