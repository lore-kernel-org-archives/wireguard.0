Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCEAC54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8771ece;
	Tue, 20 May 2025 19:43:40 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 762bb33f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Mar 2025 06:25:24 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2260c915749so87380875ad.3
 for <wireguard@lists.zx2c4.com>; Tue, 25 Mar 2025 23:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742970323; x=1743575123; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F6XnYyjWBkgMuV0QYpprdE1lSJS48p3YW3OVQycrQ3A=;
 b=RKINo0Y4gJmA1P3vTjk2zefyt9LLNqQjrNtkM3IpQUThbKxa8qaE07JK66EWxubQJ5
 E5HEzlEy55CClJ3BtZEsj3etQry0ok9Mb/ZsmUING+WAAK5nyHYTleEiYQtgJjTs/ZrZ
 /6ISkBW/DYtTG9i/jlMiOCQiOE31tdP+c63POEB2hZKLrJ0YfHe0gRPKYAtl+IaCoYJu
 2fOKHCFKywZS0kvZvCOLaKPdwECWOOtEiYst3+O/pfhhSV2cwQbt+o1Vg5DtqAPYfm3N
 +Ua91rTR+C2scWaKlNuRRKjr+ehJeKAIWyCMM/IA5kv4JlSFrIp20z2nsZchJIFrpS5P
 CGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742970323; x=1743575123;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6XnYyjWBkgMuV0QYpprdE1lSJS48p3YW3OVQycrQ3A=;
 b=RQh2s2xRSvY4iJvu8Lhrq5JSGAJW0d/kHL+Ts7jkjZofqrXPDcDYmBHoSNMrbijYND
 7WidbIuC9zoJw+sM2UlrYqKDWHgaf0EjMMz/6xNjkCZaCF03JyJn4n53me6LGLFOBrSF
 kpm6Xr6dX9S56/DCzjnBTJb6v2dWDuEOPKMo+IorRg5w5/HZoeTceNff+9bVgeWUTlbS
 6+zYK/p8xKmleXhCWD8H2KR9Y5PY/4I3mC5ObF3Ms1TRP/GfKH6CLGTC8+Gucjl/842V
 BBkvu1OrZISb8etY9r0+ObEPlzDSq+K5Ps69BhBxErbxqYDxLTaO+BxvoMmaMLWU/o58
 EKvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWutcgaerLzAV+sfIr1eiuCDzFVLbp54nHoVxlbul2OTnEBK14Lk2lXG518cNRDW65a9bcisi0HsSw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyT6WvL7jj8nQmb3sNhLB0iR3v3uzBslriCw7zfp/ozj/4ta4iH
 s5GtMatOwbDnAyW5YLasd84hPbhDl3kQa/FF8cChlAoO1ygHNnDu
X-Gm-Gg: ASbGncsYk3f+K0okyX1b0aFhLslrkXVJjvvIlUzsS1o8fyRMe+PWUVD7u+Lfbo/SJPm
 GSuGMYOO9gMG7gCSC4TV4nDX18bOdXncAeupPCVFo68lBzktmKtlZ9VsOvtp+nlw0talcb6t7mH
 SiPdLbdbHmHHEPqgga3Y3Q55nuSCMD/roLD24h1EJ4QQ5rJXa0uRT/zYeKS0sC9x81DuDAROVuT
 /rFVPiMF2PYKLebgQRIVgCYoC7OGrsOI6ofN5w7hB30ygIqMlSJhwThHKhhO2rPdBPB/gQuG0us
 Hr94XutIex+SIcADptR12t1lzhJig7K4YyxsgqjdH0XwvzvRh/2Gp9wWyYhy
X-Google-Smtp-Source: AGHT+IGbQzaER9p8NCvfFy6KxwukYMbDG7UbjOpY3wRp0sjpX6Rtq+5qFqml7esczeTeUbTF9chCJw==
X-Received: by 2002:a17:902:ef12:b0:224:249f:9734 with SMTP id
 d9443c01a7336-22780c54cfemr331643715ad.4.1742970322675; 
 Tue, 25 Mar 2025 23:25:22 -0700 (PDT)
Received: from fedora ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-227811f44aesm101809365ad.217.2025.03.25.23.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 23:25:21 -0700 (PDT)
Date: Wed, 26 Mar 2025 06:25:13 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Phil Sutter <phil@nwl.cc>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Florian Westphal <fw@strlen.de>,
 Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 net-next 1/2] wireguard: selftests: convert iptables to
 nft
Message-ID: <Z-Odyf51XgIuldV7@fedora>
References: <20250322093016.16631-1-liuhangbin@gmail.com>
 <20250322093016.16631-2-liuhangbin@gmail.com>
 <Z-B4yfBvm2aXW_Ar@orbyte.nwl.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-B4yfBvm2aXW_Ar@orbyte.nwl.cc>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sun, Mar 23, 2025 at 10:10:33PM +0100, Phil Sutter wrote:
> On Sat, Mar 22, 2025 at 09:30:15AM +0000, Hangbin Liu wrote:
> > Convert iptabels to nft as it is the replacement for iptables, which is used
>           ~~~~~~~~
> 
> Typo, but I would write "Convert the selftest to nft ..." instead since
> that is what you're converting, iptables is just replaced. :)

Hi Jason, I saw net-next is closed. Should I wait for net-next re-open to post
the new version and fix the typo? I'm not sure about the wg branch policy.

Thanks
Hangbin

> 
> > by default in most releases.
> > 
> > Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> > ---
> >  tools/testing/selftests/wireguard/netns.sh | 29 ++++++++++++++--------
> >  1 file changed, 19 insertions(+), 10 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
> > index 55500f901fbc..8b840fef90af 100755
> > --- a/tools/testing/selftests/wireguard/netns.sh
> > +++ b/tools/testing/selftests/wireguard/netns.sh
> > @@ -75,6 +75,11 @@ pp ip netns add $netns1
> >  pp ip netns add $netns2
> >  ip0 link set up dev lo
> >  
> > +# init nft tables
> > +n0 nft add table ip wgtest
> > +n1 nft add table ip wgtest
> > +n2 nft add table ip wgtest
> > +
> >  ip0 link add dev wg0 type wireguard
> >  ip0 link set wg0 netns $netns1
> >  ip0 link add dev wg0 type wireguard
> > @@ -196,13 +201,14 @@ ip1 link set wg0 mtu 1300
> >  ip2 link set wg0 mtu 1300
> >  n1 wg set wg0 peer "$pub2" endpoint 127.0.0.1:2
> >  n2 wg set wg0 peer "$pub1" endpoint 127.0.0.1:1
> > -n0 iptables -A INPUT -m length --length 1360 -j DROP
> > +n0 nft add chain ip wgtest INPUT { type filter hook input priority filter \; policy accept \; }
> 
> You may skip the 'policy accept \;' part in all 'add chain' commands as
> this is the default for all chains. Unless you prefer to explicitly
> state the chain policy, of course.
> 
> Cheers, Phil
