Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6917ee81
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:40:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80ce9a64
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:40:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80e5383d
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:32:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 96dea340
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:32:06 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id t20so11466501ote.11
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jan 2018 09:44:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <3c3ae663-329c-26f2-227b-68ef6e1b8c0a@dd-wrt.com>
References: <b96c067bafcb48c3@frisell.zx2c4.com>
 <f2e330d7-d4cb-f317-5774-05136fcb8b48@dd-wrt.com>
 <CAHmME9r5gkLJw3_mxxxNRjdk=HRsupm2Y9RFGLfSWC5G2o0NQA@mail.gmail.com>
 <3c3ae663-329c-26f2-227b-68ef6e1b8c0a@dd-wrt.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jan 2018 18:44:26 +0100
Message-ID: <CAHmME9r+NV7J12AAtPDfFxFWFd7xo=bRjBsVcZ-y7OgwiSnN9w@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180118` Available
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jan 18, 2018 at 6:39 PM, Sebastian Gottschall
<s.gottschall@dd-wrt.com> wrote:
> i will do some benchmarks later. i already did this

https://git.zx2c4.com/WireGuard/commit/?id=91aedc06052856e4ac54dd48b1f6cb5ea4b3ba2e

This works well. But would you spend some time trying to get a more
optimal result and produce some precise numbers for your hardware?

> another interesting patch i made locally was compiling all sources as single
> by including a c files into a single small c source.
> this allows me to set all functions to static, so the compiler will remove
> unused code and is able to uninline things which are neccessary
> side effect. the compiled ko binary is 20% smaller :-)

Yep, old idea, but indeed works well. Too bad Linux doesn't have LTO.

Do you have a link to the kernel sources you're using?

Jason
