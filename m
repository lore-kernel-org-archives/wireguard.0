Return-Path: jacmet@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23ff7549
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 13:04:46 +0000 (UTC)
Received: from mail-wr0-x232.google.com (mail-wr0-x232.google.com
 [IPv6:2a00:1450:400c:c0c::232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 672cb6fa
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 13:04:45 +0000 (UTC)
Received: by mail-wr0-x232.google.com with SMTP id l8-v6so1689371wrr.2
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 06:09:32 -0700 (PDT)
Return-Path: <jacmet@gmail.com>
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180613` Available
References: <b9a234e9f09a7dc2@frisell.zx2c4.com>
 <87zhzpn49n.fsf@dell.be.48ers.dk>
 <CAHmME9rwrYOfjjkNTkum7_w05YLPU4P2GQowqdCOCj_rU0bUxg@mail.gmail.com>
Date: Wed, 20 Jun 2018 15:09:28 +0200
In-Reply-To: <CAHmME9rwrYOfjjkNTkum7_w05YLPU4P2GQowqdCOCj_rU0bUxg@mail.gmail.com>
 (Jason A. Donenfeld's message of "Wed, 20 Jun 2018 14:56:17 +0200")
Message-ID: <87vaadmwon.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>>>>> "Jason" == Jason A Donenfeld <Jason@zx2c4.com> writes:

 > Thanks for the report. Fixed here:
 > https://git.zx2c4.com/WireGuard/commit/?id=ed04799b1868f45e05d788e614b9b8cfa4fcab46

Thanks for the fast response. I've sent a patch to update the version in
Buildroot:

https://patchwork.ozlabs.org/patch/932233/

-- 
Bye, Peter Korsgaard
