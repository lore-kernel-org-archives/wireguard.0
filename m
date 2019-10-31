Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FF7C43215
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032A320678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9N91GzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 032A320678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fd080af;
	Wed, 27 Nov 2019 09:04:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 125a55c3
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 Oct 2019 23:19:18 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ee2f8e6
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 Oct 2019 23:19:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id t26so3447444wmi.4
 for <wireguard@lists.zx2c4.com>; Thu, 31 Oct 2019 16:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:message-id:mime-version;
 bh=fZL+9ERM1iwnkdMSxx1C6OkuoA3wen3GWoGwlC+31mA=;
 b=p9N91GzZT3Ugu+ls/YFgL1qoaj0BInQSa+/HASgvkk5pMeeN6FdinoQW8Ou8z3P02H
 RivNsQrDIWgLfa9dFkO9GaxK2zfTek0pqOhlklhQbFDWY4fAmGEG1kry09ovQdW3Eg2i
 0P+u75Sgxu3PrjfUFIMASJcuRiwMm0nO+oYmb+khsqJWZaPDpq+dJwO6qu+aiZSBvHAa
 ylgZtTBjw0F7LgF4T0gaHDTCq6s26MX1J6s+r6M6Nfq2dVCzQVSGSMdwnNRZe8CBy99i
 +DMwedIDfh3uS6Ilv0pfOJO6asPZfIZbza01e+nGtqZDopnqup8ISaJ0JVTVKtzo1kIl
 wHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:message-id:mime-version;
 bh=fZL+9ERM1iwnkdMSxx1C6OkuoA3wen3GWoGwlC+31mA=;
 b=ErhH3iFA/NbSGj8006FECNsDCmwONs1MLEyNOnPIrs92nqwy2orbANati9OWkLuxIB
 4CDQ72vuUtH5P8kh3k6PhkHwWFTYP7AOW9eswVrtxFGuQmw9FxHmViCuU2lEU+ojqA8i
 zcrzE9OEuJjal4rTjd+9peLkC8VWBqjJVDNC/UPQPY0B2hJgX0VxQlzpBG5qZizQ6710
 moPgueVRN+7mbFm50kVVo+eNoLWjMdhT/5E6hTeXaDma+g4LLhZHrCEYnF4b/xlV7ukI
 axJuHoAA+jSVoTg33kDtwS5fa8KyhNHolxSDqEI/HL8gZa93RQqetylWtU1Dpht0/AjR
 ZtmA==
X-Gm-Message-State: APjAAAVNSzzvU7sNN7iKYtkf0TDPml7Z3eaPcpqn7J7rNRRsNPXOphHz
 GyUSBENo/41R5exNGqXPUS5yEMET
X-Google-Smtp-Source: APXvYqzP4Pc5jh9fjPlkgdDZ293VIM0SNDCODxXDQih6C6sAOMZkwl0guTXGhKCdnfd3ACWRy3iqew==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr7708392wmg.146.1572563956283; 
 Thu, 31 Oct 2019 16:19:16 -0700 (PDT)
Received: from [10.1.1.7] ([86.86.15.212])
 by smtp.gmail.com with ESMTPSA id a16sm6753597wmd.11.2019.10.31.16.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 16:19:15 -0700 (PDT)
Date: Fri, 01 Nov 2019 00:19:13 +0100
From: Arjen Runsink <arjenrr@gmail.com>
Subject: wg-quick invoking resolvectl instead of resolvconf on systems where
 that is appropriate?
To: wireguard@lists.zx2c4.com, roy@marples.name
Message-Id: <1572563954.3.1@gmail.com>
X-Mailer: geary/3.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:04:23 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

In response to messages:

https://lists.zx2c4.com/pipermail/wireguard/2019-September/004524.html
https://lists.zx2c4.com/pipermail/wireguard/2019-September/004533.html

The resolvconf implementation on distro's using systemd is not a 
complete replacement of the original resolvconf.

On my preferred distribution (Solus) it even results in some 
strangeness where instead of setting the dns, resolvconf produces the 
status and halts the execution of wg-quick.

My solution is to detect the presence of systemd during build and use a 
modified version of linux.bash that I call linux-systemd.bash which 
uses resolvectl and a changed Makefile to go with it. It is a bit of a 
hack, but if interested, I will gladly send the patch.

Regards, Arjen






_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
