Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98B2C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Dec 2021 13:08:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e7e1cb70;
	Wed, 29 Dec 2021 13:08:23 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d6a636ab
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Dec 2021 13:08:22 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d9so44466874wrb.0
 for <wireguard@lists.zx2c4.com>; Wed, 29 Dec 2021 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IxPtffpEvHUwnM6DJszN88yGrvIA0twkv0uuIQ0KyL4=;
 b=XhRLJyQjt6DzszD6e98axNeFAmKQDmhcIe3Zoxx1R7uxe0gfVp3DzTzDieYHhHEKf9
 1oOL7/iqUtfqji+E7/VjemAPnt9iA75yR+K0smIgxX80PSVsU4MlbmTC8fpC0HTgb5FU
 3oveMOdtn9uLhv/uszXieGGNvp3TC18P6nSGL2CW+ODAJPwnFwbn0JtRovdPAkwovviN
 zhe0nYTIfIFwN3aA9H8Vxj/SCxPWVDkwFwJeMohY5EaQr/duoCyZhj787td0ulo5XDeg
 wu0gWW9z7rpBk1ogo+I64VMiTsKWw8A8fTYnG+R4oMbXP7iOx2R0c1oH6SJv6Bno0X71
 JovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IxPtffpEvHUwnM6DJszN88yGrvIA0twkv0uuIQ0KyL4=;
 b=DgxbG5cheBg3AmgyFDlBg+q0Q5u7n4xDE8V+DwZi8Rb/wR5UEQXD0lWqGZXcsA3L+0
 aPnEmiflxMT6iiq9hZ4RQaO2LG95+bTJ2UFXEkknlDgGFQj9VIZUXh7Xe4oEm0L+l1cy
 b4E8Zj/Cor+0TtgraE9v1IT/DhzKAhD0JDA4uMWiZKNSLp/HNLyNtKlvPU2W+rGnoWkj
 QNBGilXMoS4wbvOjj+v7PcdC099tldM+ZGV6mngcLLuP+RKrUn+pFHpUfuZfVA2FFMmI
 nfwq9sCnYYi0RGzgR421zgBUt7Re1+8vv6CqB+QboDuZ+dim/sD1DLTg+940QwHFmuQu
 KRQg==
X-Gm-Message-State: AOAM533weae2umMANcYp+M/ookzLJHEm04RW339mbHzCJ7yjBp9ONkId
 jfkNxjkABcgZPMobtzNrf+ILB+npuevTVbY8yEoSmlkwXusbAw==
X-Google-Smtp-Source: ABdhPJx++qLFUpR9fX7YlYyDZk99pn67C+WPj/B1JPX5qLHx1Dl44oQsOBVe4B2PkcKu0Y6zpWa38hzDivcubZ4gYs8=
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr21145796wrq.142.1640783301935; 
 Wed, 29 Dec 2021 05:08:21 -0800 (PST)
MIME-Version: 1.0
References: <CABtXGiBDnVhKg-EcwSnSmkQkf=1k8_vnXADLmrUbgjFefkqOLw@mail.gmail.com>
In-Reply-To: <CABtXGiBDnVhKg-EcwSnSmkQkf=1k8_vnXADLmrUbgjFefkqOLw@mail.gmail.com>
From: Kai Haberzettl <khaberz@gmail.com>
Date: Wed, 29 Dec 2021 14:08:11 +0100
Message-ID: <CA+CGqoK=a_Vheas4z+8Wf8-WYvUfmdd4rgg51v3iER7qQ0-acg@mail.gmail.com>
Subject: Re: Install Wireguard macos without having to use AppleID?
To: Phillip McMahon <phillip.mcmahon@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

You can install the wireguard-go homebrew package:
https://formulae.brew.sh/formula/wireguard-go


On Wed, Dec 29, 2021 at 9:52 AM Phillip McMahon
<phillip.mcmahon@gmail.com> wrote:
>
> Background is that I have a new Macbook Pro for the M1 silicon and
> video editing on the go. I have all my apps installed without having
> to use an Apple ID (thanks to brew.sh) with the exception of
> wireguard.
>
> Is there any way outside of the app store to install?
>
> --
> Phillip McMahon
>
> https://flowcrypt.com/attester/pub/phillip.mcmahon@gmail.com
> OpenPGP: EA04 83D4 C864 AA7C 1099 4BE6 A11E 70AD FDA6 0CF9
