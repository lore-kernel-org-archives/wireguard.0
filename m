Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e82fee6
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 18:50:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16c7963f
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 18:50:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f810c267
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 18:27:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9c0668e8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 18:27:11 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id j27-v6so10530299ota.5
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 11:51:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK_h9uGCHrEU6uONmFW-coukMTXwZgpkenbbXnfaENpdJBJxJA@mail.gmail.com>
References: <86d4ddc168ce2c5ac69bede349a44b50d68d6555.camel@e-queo.com>
 <c2634cf8-28bf-816f-fe91-6e988cc6bbdc@gmail.com>
 <CAHmME9pZtn8i5dFC1xPNj-9x3yE+zKy86JWDtVB_mgJxNo=cpw@mail.gmail.com>
 <CAK_h9uGCHrEU6uONmFW-coukMTXwZgpkenbbXnfaENpdJBJxJA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Apr 2018 20:51:05 +0200
Message-ID: <CAHmME9rFjtgthTA3uky=BmT4390jOgk99yQ_gumyxjuppyJoJg@mail.gmail.com>
Subject: Re: Problems with IP
To: Tim Sedlmeyer <tim@sedlmeyer.org>
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

Hey Tim,

Oh, thanks for the info about RHEL 7.5. Perhaps the RPM then just
needs a warning, "WARNING: some functionality of wg-quick will be
unavailable in <7.5" or the like. We do this frequently in Gentoo
ebuilds, but I'm not sure whether or not it's something generally done
by RPMs. I'll defer to Joe on this.

Re:patch - I was thinking a patch for wg-quick rather than for
iproute2, but it looks like that's not entirely necessary now.

Jason
