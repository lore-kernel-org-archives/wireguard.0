Return-Path: dsa@cumulusnetworks.com
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
 [209.85.214.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8736c95
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 20:36:48 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id q124so64447226itd.1
 for <wireguard@lists.zx2c4.com>; Sun, 13 Nov 2016 12:39:18 -0800 (PST)
Return-Path: <dsa@cumulusnetworks.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9qYYU-p5BhR0ReNSB+__wysuDK+eEk1SisCoyf4=2woxg@mail.gmail.com>
 <20161113132347.17907-1-Jason@zx2c4.com>
 <405b2e79-854d-4c30-07b0-bd524137d2f6@cumulusnetworks.com>
 <CAHmME9rV_Qqj_QNKOARav6vOyyF-__E07saChPYo9MF6wED83A@mail.gmail.com>
From: David Ahern <dsa@cumulusnetworks.com>
Message-ID: <61deca9c-2518-1fbf-c2b4-11d410acc73a@cumulusnetworks.com>
Date: Sun, 13 Nov 2016 13:39:15 -0700
MIME-Version: 1.0
In-Reply-To: <CAHmME9rV_Qqj_QNKOARav6vOyyF-__E07saChPYo9MF6wED83A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: Netdev <netdev@vger.kernel.org>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 YOSHIFUJI Hideaki <hideaki.yoshifuji@miraclelinux.com>
Subject: Re: [WireGuard] [PATCH] ip6_output: ensure flow saddr actually
	belongs to device
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 11/13/16 1:19 PM, Jason A. Donenfeld wrote:
> I gave v2 my best shot. Hopefully it's adequate, but I have a feeling
> it might be best for you to just code up what you have in mind.

nah, you are doing fine. one more comment on v2.
