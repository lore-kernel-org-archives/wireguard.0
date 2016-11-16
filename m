Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c39de17
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:46:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3746bf76
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:46:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2175a9a1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 14:46:48 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id p16so103129186qta.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 06:49:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <44DAF4D4-00A8-4903-8003-EB0215635B61@danrl.com>
References: <A7E34EE0-F8F0-4F88-AA94-58434D0DF2BA@danrl.com>
 <CAHmME9r0tdR8=nnC4yPLJoOE8yU_7iJi0qEpx9POyM3OBZ3otQ@mail.gmail.com>
 <44DAF4D4-00A8-4903-8003-EB0215635B61@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 15:49:37 +0100
Message-ID: <CAHmME9qTLVPVrCnrusb3W32EtGYvLuKyyiGz+TWrXTxneVSrCA@mail.gmail.com>
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Demo Server: Dual stack?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Dan,

On Wed, Nov 16, 2016 at 3:38 PM, Dan L=C3=BCdtke <mail@danrl.com> wrote:
> Hi Jason,
>
>> I guess I could provide IPv6 connectivity, but.... why? It's a demo.
>
> Because it is a demo of a brand new protocol, showing how it can be used =
with legacy versions payload and transport protocol. I find that odd, but a=
s I understand we have contradicting point of views on IP protocols.

I see what you mean. That's a fair point. We might as well give people
an opportunity for trying things out, indeed.

Currently the scripts on the server don't support that, so I'll have
to write a small bit of code, but it shouldn't be too bad. I'll circle
back in a few weeks.

Jason
