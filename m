Return-Path: <SRS0=qOIe=3S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696B2C33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:27:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 034D820702
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 12:27:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLloQdRr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 034D820702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd0eff7b;
	Wed, 29 Jan 2020 12:27:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce757fc5
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:23:14 +0000 (UTC)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8574190
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 12:23:14 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id k3so8750994pgc.3
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 04:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Zw2QOXTYa4DPfoFWBlgmT0QVWsY+VSIRNslcmp73E4U=;
 b=dLloQdRrHAzD9N+RT3r+t+VeVn1ngk7JOdmn4PXhf9VBwZ5aqozvIWUq0QzaSf+6w2
 49nN1Nl1bC6myj8/VRFvqtknJXFC9Bw8rZ4pXwBXjGnfRpIzQFHeStnGX84YaP8wOvmm
 43IkND/A1PK9AndEw8xUfQVnteZ6/CiuAS9Zp3HIfBa0iwSTA2Zcw41EkjM1x1caTvU4
 gr9y9Rx/QoQmf0wCJBBaklKAwEtYIHWh7+UKTlnASItW7O9w4r/9nCWX/K+P3Bs/1mv5
 S9YKrAUWrzS4p3Q0DyrxvV2iSdNIGY8XoA67arpfYzNPZabxza5uhPQmzGj85/yl6EvV
 VOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Zw2QOXTYa4DPfoFWBlgmT0QVWsY+VSIRNslcmp73E4U=;
 b=cCQQwP1+vo7gKOv2dqjQm+55t7aH3IkvjTFATUxQQ5EIf4F00qcehf6hepg6aunqaF
 xj5TLursnSa+m+SwSOmnFYrkiVyE6or9jDPZ2yuuZF/8BRiGlXCzbJOQO29zMI5iJHIQ
 x8gVmW6KwuZZCI/cqID5KAHviYYfmBm2dTcpsZtRcFAIGSSKVasXA/4uAlISTsnmgVNH
 OaThabMrOZ8wG72dTuRhjL8vbKS1RI/caAjLBcFIgn5wl2gW4lI3d7bzYkImWn/E69V7
 7qg0EDGetyURYHUSS6KA9jser+dAOWv5I+AwaXtAHulssefLoLxSB1GN0XaPSYc2KFkF
 XO6A==
X-Gm-Message-State: APjAAAXsY38CYKGnM7XyuikojxesZ8zpCDgFu83j6DfgEYpX/VklEbcK
 OpkFk4QIs29EKlB0aDWFcpGAJV2U
X-Google-Smtp-Source: APXvYqxsajtGXiWfJo7puAJC96Gh1QHON9TNgislJuPYpCDA2oHS69K5SxciFe4TldTfyBS2XnF8Mg==
X-Received: by 2002:a63:f403:: with SMTP id g3mr30619483pgi.62.1580300594266; 
 Wed, 29 Jan 2020 04:23:14 -0800 (PST)
Received: from Gentoo ([103.231.91.35])
 by smtp.gmail.com with ESMTPSA id r145sm2749967pfr.5.2020.01.29.04.23.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jan 2020 04:23:13 -0800 (PST)
Date: Wed, 29 Jan 2020 17:53:01 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: wireguard ci hooked up to quite a few kernel trees
Message-ID: <20200129122259.GA25949@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <CAHmME9rProfVf4VGHGX9no3KTa08nL_oYkK8Nv+eknk4ewVMAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9rProfVf4VGHGX9no3KTa08nL_oYkK8Nv+eknk4ewVMAw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 29 Jan 2020 13:27:00 +0100
Cc: Netdev <netdev@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5075603074328937134=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============5075603074328937134==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Looks bloody good Jason! thanks, man!

~Bhaskar

On 13:15 Wed 29 Jan 2020, Jason A. Donenfeld wrote:
>Hi all,
>
>With the merging of wireguard, I've hooked the project's CI up to
>quite a few trees. We now have:
>
>- net-next
>- net
>- linux-next
>- linux (Linus' tree)
>- wireguard-linux (my tree)
>- wireguard-linux-compat (backports to kernels 3.10 - 5.5)
>
>When the various pushes and pulls click a few more cranks through the
>machinery, I'll probably add crypto and cryptodev, and eventually
>Greg's stable trees. If anybody has suggestions on other relevant
>trees that might help catch bugs as early as possible, I'm all ears.
>
>Right now builds are kicked off for every single commit made to each
>one of these trees, on x86_64, i686, aarch64, aarch64_be, arm, armeb,
>mips64, mips64el, mips, mipsel, powerpc64le, powerpc, and m68k. For
>each of these, a fresh kernel and miniature userland containing the
>test suite is built from source, and then booted in qemu.
>
>Even though the CI at the moment is focused on the wireguard test
>suite, it has a habit of finding lots of bugs and regressions in other
>weird places. For example, linux-next is failing at the moment on a
>few archs.
>
>I run this locally every day all day while developing kernel things
>too. It's one command to test a full kernel for whatever thing I'm
>working on, and this winds up saving a lot of time in development and
>lets me debug things with printk in the dumbest ways possible while
>still being productive and efficient.
>
>You can view the current build status here:
>https://www.wireguard.com/build-status/
>
>This sort of CI is another take on the kernel CI problem; I know a few
>organizations are doing similar things. I'd be happy to eventually
>expand this into something more general, should there be sufficient
>interest -- probably initially on networking stuff -- or it might turn
>out that this simply inspires something else that is more general and
>robust, which is fine too. Either way, here's my contribution to the
>modicum of kernel CI things happening.
>
>Regards,
>Jason

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl4xeR8ACgkQsjqdtxFL
KRX0iQf/TkKseJ2jksqjmC+bnMd9mnIox1pWzGwElpv1csKIwul3m+TnHGRFSCOu
FBbHlw0MSrrEB0dOyG5NJr2GqtGiEJ1ogoLT6XjUq4qpcaIljJU3gU35c6UKiM12
ThYstC9ZfdXoPgPI5n5qL3p8rTp71Aj7b947ZRfQ2SEMQiEZ5wEgwAwK+fV0yAsa
VwqJxZy2jZTiOABqW8Ez65YyhceUDvGfv0G1K6EdZdyWfHsoOHXUH24C4jdtGFWi
m+I7ZnFM9LFlzz1Fyh62PDwIBMYHegW3rvm6q3XawJo4+8VYodApw5axbRDfjGFK
tMcQCZyCSD4Rtpv+Vrfg0Toveq4nOw==
=cnyd
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--

--===============5075603074328937134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5075603074328937134==--
