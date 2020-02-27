Return-Path: <SRS0=PDJl=4R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D314EC3F2D3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 11:35:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C4E246A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Feb 2020 11:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LefzqRhx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79C4E246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 469dbb43;
	Sat, 29 Feb 2020 11:31:04 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2d61198
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Feb 2020 18:09:10 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c13so4593215wrq.10
 for <wireguard@lists.zx2c4.com>; Thu, 27 Feb 2020 10:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=GUJXVRpyrM2UYZfGChd+W2jbEUMehhSCWz9YVkKFjh0=;
 b=LefzqRhxwrKIa/Iy0WrG0q4NG7kPR/I4jFHRpCSOKiZ+SBz4WPXKX4vn6Q9QeczeGV
 Quxp9CFewvnXonBohKJADu1z7oc5VC7o8QU2uTv+CxRUxh7P6KtywWs/MN8FULSwSKzC
 biKNiOra6rDIiCnalvKQ9bUOXRNYM6Bti/tf/JsCR5SyQOOGApjQui/rzA4sLwF/Zs/1
 W7TcoegcUkEsZDpf3ZU9JTKu6Jh5cQeH8LJJ8jU58tK3gIubAbD18h5isVBpGwygTjsr
 H9plOAciTmX5x6TvyojpaMk+9MxPPHVV6D/+CB2HFoR90rAHyDAFoUKH17Z4MAFttkEv
 MysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=GUJXVRpyrM2UYZfGChd+W2jbEUMehhSCWz9YVkKFjh0=;
 b=Lp8zPgos+OmXxrhRk/S8SHWWxkLEvYSyOmFOx1I8PmtCXXH9PpoEBbzGKaNrNeb8mN
 HVd8XTIecX9wxLuEpezy5IFCrdIXIXJ47mskRvbK2AkT0Y48G/U4DJbzua6Sk22QSjWR
 RS+V1rZcApkwkKUj9J2+ItFMTqfexVZ9MUMUBwoWyzvhXi+kGfd6MliI7fYqbY3Ko3vn
 fK+/yZo0SAa9ml6Tg7o3Ff1uiuN14HWcM1Iki44D8uADhjn1Em66nsCrXbztngB34jwo
 MNXtd5ZMV+TII7nixCCQI8iVbTR5T0zYaN8I/D1PHGYTiLF1hXkYRw64p0UtAAEgI6UI
 7zxw==
X-Gm-Message-State: APjAAAVWjwK1U5zx44XnxqZZz7UeI1IQf+gjXs46yOyIF6MLhhV/pyRe
 cu0zJcPRQRL3phf+M94bfjhab9w=
X-Google-Smtp-Source: APXvYqzb4YIUfhZL0Vp43bwbTorc3FcADJQZt38lL+oWRxSvTOw/hHzEX5C3cFz9kCEpRWu7jBrptw==
X-Received: by 2002:a5d:610c:: with SMTP id v12mr131513wrt.88.1582827177909;
 Thu, 27 Feb 2020 10:12:57 -0800 (PST)
Received: from mechanicum.chadwicks.me.uk (mail.oesys.co. [84.92.86.82])
 by smtp.gmail.com with ESMTPSA id t131sm9093473wmb.13.2020.02.27.10.12.57
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 10:12:57 -0800 (PST)
To: wireguard@lists.zx2c4.com
From: Kevin Chadwick <m8il1ists@gmail.com>
Subject: Endpoint default route (Windows)
Message-ID: <96de0e37-fba0-9187-9bd2-47e5fa469edf@gmail.com>
Date: Thu, 27 Feb 2020 18:12:56 +0000
User-Agent: Mozilla/5.0 (X11; OpenBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-GB
X-Mailman-Approved-At: Sat, 29 Feb 2020 12:30:59 +0100
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

I assume this is by design for portability, however it had me scratching my head
as to why there was no UDP traffic being sent to the servers IP (endpoint in
client config).

I ended up with two default routes by accident on Windows, so perhaps something
screwed up there but it appears that without a default route, wireguard will not
even attempt communication with the endpoint IP, even if you untick the kill
switch and can ping. Is that correct/intended?

I have it working now BTW.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
