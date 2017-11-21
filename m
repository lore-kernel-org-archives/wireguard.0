Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8b9c774
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:33:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a97fb5c0
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:33:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca67c86a
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:33:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 64f635e0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:33:24 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id s4so9170282ote.4
 for <wireguard@lists.zx2c4.com>; Mon, 20 Nov 2017 16:38:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pFmoZYR2Teh2t+6hjp9HNZcE8o_jvZ17Xvzqmf7bpd6A@mail.gmail.com>
References: <20171120231416.Horde.CgDTFw41-BBj-IomMwxyq3_@www.vdorst.com>
 <CAHmME9pFmoZYR2Teh2t+6hjp9HNZcE8o_jvZ17Xvzqmf7bpd6A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 01:38:19 +0100
Message-ID: <CAHmME9r3BDd97=tZZg1kxn_gyQPrdfsdOkLo-Zv=1-rZWDqnHg@mail.gmail.com>
Subject: Re: netns.sh stuck at ncat.
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is pretty strange looking, and appears like it's a userland issue
-- like the versions of ncat or ss or whatever weird scripting hacks
in netns.sh aren't working well with the tools installed or some
networking sysctl I forgot to toggle... Maybe one quick way of testing
if it's an ss issue (old RHEL tools, or the like) would be to change
the function body of waitncatudp into just `sleep 2` or something.
