Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44ee2c6d
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:22:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b3b37be
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:22:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc5d9505
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:13:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cd6ab655
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 11:13:54 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id u73so11768286oie.3
 for <wireguard@lists.zx2c4.com>; Mon, 05 Mar 2018 03:31:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8f4c1033-d41c-e358-58f2-cd02618e5e82@dd-wrt.com>
References: <41222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com>
 <CAHmME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=rMXLt=U5FA@mail.gmail.com>
 <8f4c1033-d41c-e358-58f2-cd02618e5e82@dd-wrt.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Mar 2018 12:31:58 +0100
Message-ID: <CAHmME9pMfRvEMeGVysnKV+s7sFOv0t=za0kVHGhwZgEWoYKEqw@mail.gmail.com>
Subject: Re: Tunsafe Windows client for wireguard (not opensource yet they say
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

On Mon, Mar 5, 2018 at 12:29 PM, Sebastian Gottschall
<s.gottschall@dd-wrt.com> wrote:
> it isnt closed source. the sourcecode is provided as far as i have seen and
> licensed under GPL
> but correct me if i'm wrong
> https://tunsafe.com/downloads/TunSafe-TAP-9.21.2-sources.zip

This isn't the source code of tunsafe. This is the source code of the
OpenVPN Windows tuntap kernel driver, which has been hacked up in
various ways for tunsafe. That's a super scary driver, by the way.

The actual source code of tunsafe is closed source.
