Return-Path: <SRS0=jywV=SH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B63EC10F0F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:30:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA2F21726
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtRe7pxT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFA2F21726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c15bd9a8;
	Fri, 5 Apr 2019 15:28:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc054e54
 for <wireguard@lists.zx2c4.com>; Fri, 5 Apr 2019 15:28:31 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbf8d03a
 for <wireguard@lists.zx2c4.com>; Fri, 5 Apr 2019 15:28:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id c1so7138952wml.4
 for <wireguard@lists.zx2c4.com>; Fri, 05 Apr 2019 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:openpgp:autocrypt:message-id
 :disposition-notification-to:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lGBNNA+9f2WZlR/5MHHEXFTXQr41YiUXRR8cRbnK8+o=;
 b=JtRe7pxTQ49JQQZ/d012BRxuYsyWxnf38u7joN7c/rbxcXv3UepzF/YLaV2C4bTLnB
 Yfbf9Fo7/83DqkkkIonMKCHAgMoS7V2PFQeiAs5vDGD/qCJNI+6Iq3pdfeojj+m8UjIj
 OwVfDDbxd02fjqQZJ8ajJ2yJv9kZeAxKz07W7jefvt3cbx78bB9r25wiFuv7HP/fcB3Q
 s0uMJ/TQvpXX12MmV6avvAfrT5oNjBdzwYz47iDT2kkoL1AjmHFDDDbCM6K3/3Atf9mj
 AOTuVRIKFj3m+9P2Xtmd0hJcqnNqMPQ0INEQFPLZz/RubEFvQNmodBHYsubGbVADfsi6
 wvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :message-id:disposition-notification-to:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lGBNNA+9f2WZlR/5MHHEXFTXQr41YiUXRR8cRbnK8+o=;
 b=euXxDfzrry3WioVNK0EKbeBXUaeUvriHEIikRqyEwdtE4oRFJMtyEr+TrV6P3A5MCe
 ASYn3ie3sZQVs1Kt+FNyP0i1M8bIeZY3MT1d/1jOFHZq6JcSqaeL/i240RfurCXkzmSl
 BKH+NMGxl466JNGNp+703TUJTMlccYbgjW69zhKZxDrXv2jIm8bFK++8XEQ5xWTi8RY0
 /Xe73gRTk6bIemATHNNjeOX9EEl6s6Xi/0qNlm+NAaOF5m2ZOnFKXrahB7Vc/DxFuWMa
 BytrEGycQipLwTEX3H+tTJMIe/grKurMkooHSZz/67u+F2Fo8oRgrAZEFTRjmn8XzIc3
 UViA==
X-Gm-Message-State: APjAAAUDmKzuCbYVVvHVEZvgPDYTIY/Gn8szYHS2GHhEMeV29IEJd18C
 UzyJauQI1TT268dNqKl9djK/Rbbv
X-Google-Smtp-Source: APXvYqxwiMptnJIpmrpkZq0Ba6RTnb/tccCtdV4gc4055KNk1T3rSDPrmgUFsrNiH/Banve4IfUOZg==
X-Received: by 2002:a1c:808c:: with SMTP id b134mr8322358wmd.16.1554478251281; 
 Fri, 05 Apr 2019 08:30:51 -0700 (PDT)
Received: from ?IPv6:2001:470:6aa2:a0::30? (tornado.nanhome.exbit.io.
 [2001:470:6aa2:a0::30])
 by smtp.gmail.com with ESMTPSA id v17sm1791874wmc.30.2019.04.05.08.30.50
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Apr 2019 08:30:50 -0700 (PDT)
Subject: Re: Server with multiple peers
To: wireguard@lists.zx2c4.com
References: <CAAJTE62-YTQ_3Kuii7T2z4-aOr5FrrOGF7WgxVnZaY6mu0XuPA@mail.gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Openpgp: id=97D58E607188C8C986481CB76A2F898000519052;
 url=https://keybase.io/aaronmdjones/key.asc
Autocrypt: addr=aaronmdjones@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFedLrkBEADBntJKJ+0hk3NzXOqWKh27ftm81NSBzZdYwlheZ5M7wGNwUrpHFzyPmgwe
 0tU7+J+F3IEOpjWTwYC3ELVQfZ/R5/rJa1iVZf+PGyom7E6DskgaZoIsYfNECPL625MsKAOH
 M613gZZ0jXadOdyn4jFl6ZmiockkpJZdY8GhXUwrqtoxRgRwXrWS0/2V7D1Ky98ttfZN1juS
 pdOyzSWT7KzZnULg1Wx9t5gx6jdckQNKxkko2RGTy8DKTPHeOLDdtsShISog8ryLFJQwANnX
 /WezuB5wrABNit8NmnBAXAM9S10MmvgOyoMZkymUfcjwKLSjWMvV5g7Dgav6tZRxpcCtGtTf
 l3sqJ143yEdj7RoB2qtoIPr7IBvHRB4aYi0z11q0MitC7dAK4nqwG9wNCx9oYF0PqKCcdIBy
 f/arn5gci4iI207sn8kMvZKgRnMDxPs7I22Zd6Vu6KcIHk+PLOQ42d1lvKUWcMWgvwKLOimR
 ujMwTYuuNw2MPZT3cbpxjGj90NrCcXGMikovnYeEkLWvCO0KtayBjiWVznCrskobZ9n6RPAi
 FeT8XEBr0reMWApyvW6JuXNHF5rMm2ZROOSd6kcXnUWa7SZgYFUf1VB8odb2iBc7Dz3xYk9s
 tplJTFcbGsLIPwgIC4/Nfu88B4xwNHgIyvFlpEaJvRnr6TaNtQARAQABtCRBYXJvbiBKb25l
 cyA8YWFyb25tZGpvbmVzQGdtYWlsLmNvbT6JAjgEEwECACIFAledRecCGwEGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAAAoJEGoviYAAUZBSiIUQAKJNDJ6VIpfBc9SyH0iU5B1U4rE9XXJN
 ut/6SoLNbOaYmPAvVZ4ucqSWkOwRCvcaMJgJLUGNSokMojYbSIz/AdqOMUW0mlOlAzyf7jzp
 gWP0rJWm9yIpLVQ2KIDiyIBFSk0wtofZTuOIj4nRUEdgun3isqADG+wKldgiC1puAArLhrF4
 jKVHxhrXt3Uqpp9KMt/9lisHITYkf1Z0QIMpN51Uz664g5Kzr7E8Irdc7KhGuY8I9GA4Kc11
 2finujTi0YmY8vmjysMt0OU6KHhOfP3YD17tjr0PijOxQEVYotO62Za9XfcSblXTlM7+8TOR
 bvOszY1dqXRQ5yON7OSuIMt1p42HyK6fdid1v5653hWhsxOwcKGTJuhP6R48+y6mdMSGflRR
 2z9WfCyNlAOjPOJV9WFvbnwq5S/5qOuoYulDhFmPVGkUszklrfxQZVxM83++qpVddszpFQvv
 FMZAgU1AGgXV59ozxyy6GZJL7ejSaThW6mgHkxAATEioCmTmGAQqjtiGr6PLXgsEXZjKr4RG
 CFlxWBrNXFrTTeytLui6NjNGdJB4jj75/SKQ5KKe4WBoxJJUgVlRwMQ6yCedNkcZDuE7EIeg
 02GS1QVFY9So0Pm17ZkZddljW/jBRw8bbdVssCHTHfOCD6TLHqKS9lFMdwD4xt/7Wu/x64Gh
 gJI2uQINBFlHMkYBEAC66i1VpMrOL9S+g7pbSBz+ww8rzgWsIqFg3DCV9TcSQjUMRaGH/a7L
 D1FJL5rInCuhI5/HHCQD8FAY6Izj3QQir7gv9VdiE6ejUPPpAy4hh7BEgvKxUxtWSLN0bnN1
 pF7eCBPBFg4yFFMQQtCg8W8NeGfn8jaKPCD7XbPBrEeWpz7RL++x2CGtUh0SJKS6Rko04IcM
 vguJO3lRrloYQEuBEyumIhJSc4uRu/TNvBhPKVdD+XU2LMITwEOelVB2WXDQjMJqBp/ds+tD
 kLz4PipsbZAmjuVks5UI+A3nyHWMivnZYYDcvRUsyBSwoyFl8hiz0UZP6X4PFQoQ6o0AIyGp
 N+7f2ggUaZHVp/pWVvHpMUGzIqMQTrntX+5et8+UKZSwkMirJRZuod6dp6w+o08ijelHYEAw
 IUslmsmvKRfbZXriDMz7WSjfspqg59fIAJWSFSuHY6LnJ3SGOb1+HWBnao1JcWTikjtoiTf+
 EY4SQKiBPeXNp0peIOz/l7rqS570umHt0U1ZFCcoxgXgwsA3mpaIQO65fIK8yzoc9DB/cBPZ
 kc0DRxmXuzSVceGQegLd25vfXXGs1iC6QsRFZmNNM0WW3w4L9Q/PFZW+N/s4cgaWcSExb7ja
 1IO8d1nkc09JuXfbCtFFj2+bIT9bngfSE/wN4hhweg7p4z6xi5vdjQARAQABiQREBBgBCAAP
 BQJZRzJGAhsCBQkB77QAAikJEGoviYAAUZBSwV0gBBkBCAAGBQJZRzJGAAoJEIrwc3SIqzAS
 UbMP/jmmIesZjdaSbSTvC8NJtxvHmb6cntDB/UUvxdNxWaFKrrd7/+jNpZDDnDSkOhWRRX61
 S0yxx2BxJgQRP+vOpUpqlMseNog7bf6dVGPyV8iNyMb+xYEScNyK3na1G+HpU8rX9ug4iaA7
 JZYlX7UmEvom4dh8uA2O7edMo80yY8Ulp1sMTddFO0dbbp7M2cc9QgRdhVpvMrr7adn28pBc
 /hYv4UyKtQJHzCZksfu+NDHHRcZiDIwd/ma+lv20HNNlj8M+cZO61v9M1CFPdzln0iwR36Rz
 zl8T1cqvac8L6C8aaox74AQWzG89Oes/IuVjB2Pjj4MmGoDLRJ21prsqfAI7l59/S1KWzRDK
 R5BmU4fkGeaj0QMNiUSUQZIlEeLGKU7Is+HIKGKodIAbe4qe9QhaF2ohwOFgfBgCXwa0KJjU
 4oPlINZdixk8rQarIvwExJ1YlJS4i2P9tMaZT6MbK6OvNCTtIsu6KiG3exIR6cPVxcb13L66
 4S9tL83EwcOlqLFNDHWfgGCkNvLXsHmfAB0l+usXSOSwEujk0DGqSfV4me28JOLXqWmSns60
 gXXXJrQaTrXE8KYke4Yn9APoD9SfUwt8lj3r4qF0rcV4YOv5msETjeihHQTgiFXNPFrY/X+A
 RWmLyhoGxCTaCdwbB+rZ5W5uyC8KfQYmWbqF+ziMsxcQAKAuD+MBrfuEdb6csZDACh4IzS7B
 Vo984GuQ48BoJ5yx9HyV5EmX8ALzMCg1y/UTkwvV+zQt631C9RUBuwGtbSoTgN0eTNwJbkSx
 TjGWRSSrzTaojv8XipSR6wJHx0ngSrU8n7n7SayhkYkaEA6E29lTt6vJNGAKk0obEOTKXJIp
 Y+Q6FrTIj3FvD0e0mmQdz2RDc3nH+UsbhnJros/cntmEeb4lmxJqD4yt9reHSnZtCBmCW00n
 hvcEag+xTF2N7P87mkvXTFzohMRm0qWcIjh97PNYFQTTRSiH6Hs7iIUYsWNIyg10b3L+bYC+
 +IJjaHUqSR0M199xPUCH8Ji4ea7MJ1nKry6RbAYpk9GB4xxn5peVHvehesKL+LiOWcBbyoG2
 pX144MJhesCd3K2RDuI3hiNtkRuxFJwHWOKJEsAYqfSPEHGynLXbgwwqJM6yFldBzhVrmLjC
 BmspojEVxmkF3wBVyz3RLuhGxsTyGiQYA+GR5zzOk0uqLEcfwebAvHvv28Mj/dHwXLGhmHgZ
 o345T6xYKMQGCaHaFDpXM2M0bBiMama6ggwb5xM0/unv8AOCtTy1JO2v0DqzDfEO+xXdiWX1
 MWwLiSh1Fg1xDvGRs/jo/mh6Tv5qZJbkd6slf8412J2wsWqKCsJorZfT8s3l6F78mT5WAiEz
 yUfHgfEYiQREBBgBCAAPAhsCBQJZRzaNBQkD0j1FAinBXSAEGQEIAAYFAllHMkYACgkQivBz
 dIirMBJRsw/+OaYh6xmN1pJtJO8Lw0m3G8eZvpye0MH9RS/F03FZoUqut3v/6M2lkMOcNKQ6
 FZFFfrVLTLHHYHEmBBE/686lSmqUyx42iDtt/p1UY/JXyI3Ixv7FgRJw3IredrUb4elTytf2
 6DiJoDslliVftSYS+ibh2Hy4DY7t50yjzTJjxSWnWwxN10U7R1tunszZxz1CBF2FWm8yuvtp
 2fbykFz+Fi/hTIq1AkfMJmSx+740McdFxmIMjB3+Zr6W/bQc02WPwz5xk7rW/0zUIU93OWfS
 LBHfpHPOXxPVyq9pzwvoLxpqjHvgBBbMbz056z8i5WMHY+OPgyYagMtEnbWmuyp8AjuXn39L
 UpbNEMpHkGZTh+QZ5qPRAw2JRJRBkiUR4sYpTsiz4cgoYqh0gBt7ip71CFoXaiHA4WB8GAJf
 BrQomNTig+Ug1l2LGTytBqsi/ATEnViUlLiLY/20xplPoxsro680JO0iy7oqIbd7EhHpw9XF
 xvXcvrrhL20vzcTBw6WosU0MdZ+AYKQ28teweZ8AHSX66xdI5LAS6OTQMapJ9XiZ7bwk4tep
 aZKezrSBddcmtBpOtcTwpiR7hif0A+gP1J9TC3yWPevioXStxXhg6/mawRON6KEdBOCIVc08
 Wtj9f4BFaYvKGgbEJNoJ3BsH6tnlbm7ILwp9BiZZuoX7OIwJEGoviYAAUZBSxkMP/3f2arpN
 z6dLYHCaM/0Qd0F12Wx5YGOp2CnIawWJp/ymQTXwpMyZB6WiZpUHcw9EzRoLmsZEjVPIG4od
 Txdxtxgo+iYnt6zJ37pZCYc/etLbDs2bXvqdHNDXuBqxTz7IV1/Dq6K0sGTXBKflKrgbITbk
 U4JlZBElKtrWTAu7WxePiIHtQT9DyWfllDXBsKrGlfaAs4aymP5FRZoA1581V1H0AfGvplTR
 qwKCHzE4nS+kapl1zMP37Vqd1T+BUjBwRQhDTcIdf7766cDq9eURa/fX7XX6T41vjLAr2XbK
 SjQUyGG0eD6HckjN7JpsUPGiUey3ho5eJhWHKtR+8lt5TwgRwzK6C4JLOU4rXRr+7Gn+De2p
 sTzSf/8W2FBr03J3o24b7l5XzCYJExjqFnAmSbuuzQVKM+vtI2i+BBM9Pive4wWAlxz4Dn/J
 ahCd66N8gChtoDJWyGWQD6CNofe52DA12dEVUAJgSQDA4Ib2R6E5N6oqGpZvwZM+S8OBYbag
 qxvmlDtTwELBCr7tVYz4gLHXcBfEh1fU3NECrZiye8boRAV0IysnO4U8U+NQh9SvTnR7fkbj
 GFrcyfVtp4aNhkeGADoWNtJCl6AlsgNkT2Zcgm1Us5FQdL3h5NQF6VO0GGmCRpNTEWEtYYIy
 dlfFzlV2i87aJNRjIs1ZwiYkuIxTuQINBFlHM6EBEADAvl9iatEY3MZORRxC3rBhSNWXfLnz
 kpvK54DzyQ9wxh6JXoGE6pfV9yG1b+cFZcprnuXK8DIJXnX1cxxsZ9jnnqt8mnd8aJF17iBg
 diukE2JpXXGYygWq8bnOFKxmDjnQ/ZfMgjuXn/9vPRJ4MhINvgEkGBwxTQcOVIGnOYnbCrjC
 wcgBFGkdKNiEN7gBfyiUTby2x6tBGTvb/FmVook/Z94AZsroolkoF06Pb0GPzHSekWgKUCoN
 K1FQXTx56yO9j5xt/lK/TSSEhDeGad2xbhQFV64KK6c403hF6NseAo0B7UmuJ49NTRg6MKuE
 OYsqs6QFwNVKoJYXmX4Nlee5gIiNbVar3dzaIx8fBq7Esb6sm2B8zmFj0ae6nUN2r+CdtLUk
 J48ANA1/ACPeeeFuUPrYt0f6MRgFv4EgxdahVXBkspSiiT+C4QSAs4G8rH8+mviOh4AI8cUl
 cVF5qbr3vnjqsWHPvZyv/rjQI3ajafzjO916DjokwPyB7cKlfemMnhMhYIu1BLDnQz6Yx5ok
 hXAuVHwyscTlOBHJd1879qF2hF2bar1jLVbuWjGRbhRzywTNrxlxU1MEEU/tarHH9FLLB5BZ
 eayGPcsmLCKp4lpfOhq2VSwzhMFa+rDhvlrJfG9PS/PCQRQR47tQTCuJ63TBw6/tPxep+myf
 7/3srwARAQABiQIlBBgBCAAPBQJZRzOhAhsMBQkB77QAAAoJEGoviYAAUZBSxaUP/1sJ1Vg4
 0doTwQtJr/iej3Dx2EndABp5LgyLyDJCODlUM5VSYrOI11TWDdsDs1pkTTxBoa+G0goZcHWs
 fkrLUlSf3Vh3LHX8oe+CMh/HrMt8Sf1YjIxz1Lc+ZDL8NaRY0f1s0lX8XMoCwbBu0mcbscN1
 utc7xLu0sjpUn257NKIhMTE0tQABdo0thnbJMSrNalAk9M3arTo8/EugLPKw7UQfanimqzFI
 nBZIxEfhZ16pCzcSyf3WriXf1AbkoE4I4UV4pau6sy44VsPiVsxmNUDr27yAOB1R4KV+4oY6
 j0nKMYsjk9trhVhFed08153GRsnd/k9ztkgvAsxwh6BnKYLF/Db3BxEkTQwgdayUmsOPCnqd
 aJVVRmWyRtSB3ZfhjQ9G0le6QPO325H9UUQ4RPnOgdwEEAzEkGVKO66DRkfWXIKZjszFEDuc
 RRJfsdLND7kZBFBeoAhrmm++jzLLa8j470jrywPqASUtisVrVnKwjb/3WKblWF7woFPHvRhJ
 BYz2c4QH4EuGIggW8AxExr9e1cdteTs/2+5E67vkWnMaJcTeQybxrh7GEGw0JxsRkKqP/PQx
 bIc5eZZJ0FigQqJkOGNvv8OZAmwzLXf6F1r2200g58/L9H53Vrw3ppocMbVN2yryR78qTqRZ
 kd+SWyQgBNScj2MSoCJOxKYbH1+xiQIlBBgBCAAPAhsMBQJZRzaUBQkD0jvxAAoJEGoviYAA
 UZBSLnAQAI9lAq/WgTYvdHZsy8Zvd3SKQ+0FDJPb8K75UYV5dnsVq1eRybXXStWieuSYq+XB
 J5KAcnlrz8yygPVFc5OLZit4XeYeAsXnCp5JWfDjcd/c+wnYvqgOv3m330cxdsDt0mkj1BK0
 dqnkx5r49Zw7VTGlCnPFiJRUbho2DihwC6r6ys9aAejt7AhqcXv6w3mztjfperGeN9hICOI3
 6G3uLgmUmx2z3pedpKPWDNwKWKI0zE+B6yNLENN10PGSJjHMM5nil7ILoqZ40Awg/+nZgJCB
 1FYDgbI5NQvhN24Uoh8Wz5EV9CtXg2bDoPi8MRIBkV9oJU48Te5wFuM2uoppPLOon2z29zsV
 kNOzqQ7jIUf6iZkoQV3j4X7EES5cfPYt+r2082BR7FPuk4oJQHja2uoZatxi3NNAyR3+Nj7V
 O9ZDz6vZ7Cm3tBtJFJnCOGdDvsQ/zsOYkqXSfY0hq0I2Qm3JVqCICxom+2qlBN16lpteJnwX
 zo4QFfy7qazxzc9ra1FV6N0xzdUbT0hWPzgV4vlvsAqB18IZEgl5TlJqo7LmcHUUndc43pbH
 HcvbbT16z0XnTl1tpgthVl8MhX+FdGEDqLEJzmExLMnmvNhn/UwXpjxFCjkfpK2U25y2OyR5
 uU7wjkV1U8cPmP7M7xHchPfSRDMU0ThX8hT4Xw3rbm/N
Message-ID: <09129085-bbbe-79da-3b03-2e41c67eafac@gmail.com>
Date: Fri, 5 Apr 2019 15:30:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAJTE62-YTQ_3Kuii7T2z4-aOr5FrrOGF7WgxVnZaY6mu0XuPA@mail.gmail.com>
Content-Language: en-GB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On 30/03/2019 00:45, Indro Fedrigo wrote:
> Hi Jason, I'm trying to create a server with multiple peers form a
> wgx.conf file : the parameter AllowedIPs seems to get set only for
> the last peer... Any idea ? Thanks for this great piece of
> software! Indro Fedrigo

You cannot duplicate AllowedIPs. It forms WireGuard's internal routing
table. You're essentially asking for "If we have traffic to
192.168/16, send it to peer A, and also to peer B, and also to peer C,
and also to peer D".

That doesn't work.

- -- 
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAlyndKEACgkQivBzdIir
MBLnIRAAp3UURDFtevTlWUSwgKiVyzN9eT6MGtHi1owDOSVafWPoHJ+pM2PGkPj9
v2aJsgeJK6cIC6j23F8G0ombgGsVaNFTVjeOLNThzgkv2DXJhgWjDu1iuyUmlAI6
ZSuZ9ccd+OPa3YMGX9apGTeulvVjYGs06yJ5xpgCsqIMhCnj/XOS9HoWrGDWHqOA
3AZJK9/i3jIXQHYPSCpdXrppNCw8APQWgNuB1aDPdBMcw8bgARiJzWDF7Q2xBPxx
SXS2PnFp9oG3+CNqGpEKnurUfx6QSGDPVps6a33HGpdTTAfyZw1Ha8ZSQgb3Yzt0
U1JWxhLAF+o9ubkK0n9Q0jaunrDfDbbuPmvNF3ZAAkKmITsXPSieT0WB6kXk7l0K
HZbyEexGLwrCTbLhublIazxQZsJe+ftz8liOrQr3/arGKS1NYItRV0nRKKVSR5Xx
CsUV4Ngz2Wm+gFaET4QmEJJCARY+LNV+Ntrm+R+s+5vgGK1AJ4iRfR2vYt9dotje
NiyHqF3FTFpqNK/tZ4CXgROniAmqJs5R4MRRqE5cgEsX8te5iDeCbtZPaAQepECj
+tWhd10//pjr0G5PajPD8bzIWU2cgHT6JkqwA4l/ibR5EaJm7LQvS0ppUVzS6poy
bbY0YILEtPSkDioZhxkZ3GTR2rAmE5lcGdW054CYDEdhfx9bYGo=
=6Gmi
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
