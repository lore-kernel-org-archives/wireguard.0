Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00820F433D7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Apr 2026 02:18:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3388c72f;
	Thu, 16 Apr 2026 02:18:34 +0000 (UTC)
Received: from mail-dl1-x122a.google.com (mail-dl1-x122a.google.com
 [2607:f8b0:4864:20::122a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 87a43dc9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2026 06:25:09 +0000 (UTC)
Received: by mail-dl1-x122a.google.com with SMTP id
 a92af1059eb24-12c55e3858cso1434314c88.0
 for <wireguard@lists.zx2c4.com>; Mon, 13 Apr 2026 23:25:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776147907; cv=none;
 d=google.com; s=arc-20240605;
 b=eWLEHlg3zaq33/Jd7zwt03+ydIYD9/a4SsaJb7jCLFwWveXuJQbJrf0VjaWVLQw5a/
 aPfmFSCwyLSrGNsKae99doyKmlk49j2I02K/IYsuGFL4Li7+se2+dhP4KNlBkV+PZA2Z
 JxQaDXR9+InmRoqGKBayWM5sLTKfvD5DfwSzzrEpuliOlnT18d9Zi7YnQxQCzjSpyRRp
 PUEI7YTXQEoQkZr5xdfoL9Zf5Fq9l4wa2V3TN3fBxTcd3LFAgIl8K1usLe39AU8savPu
 t1VyMhK8EzMBrQsk2JUAUi40/Er4dlZkay6SJT9eVIlPcRUahUcoMN3eCyzNb0SkHzcm
 T+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=Nn/jzAhs3EapmDwfSpnGwMa8V3xee6nP93fBFq6IzPs=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=htfnQxk7zhijlmvMv0krsRLPwRG5PYcFXi4p1UCtMqXktYCNrHFDuPcrDEpo8E+jhf
 Rqwbmc6IvVZPkxMHYWp17G8BLY7QUiFc12x4AUD2rT899+ccMnbfj1GhofqL6FuJwdjk
 3idkc6sVoH7/T77F8B3bHlVRFY2e2Cf2VWYhb2sL10xMEqJ0KqmGdykzrETZHrrmnNVZ
 FUWIrnvSGy8pV4+vmLYWTUT6bWuI36xlxjiuklZFvKyK7uRqscN2G6zmaZ2O2pvHvD2m
 ZSzE75kHpeIj6PhltbZlw5c2/rsIO/2ydomQSUBMx5ol9lrImGVD8TO/2+a5/Wc3JyTc
 DdtQ==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776147907; x=1776752707; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Nn/jzAhs3EapmDwfSpnGwMa8V3xee6nP93fBFq6IzPs=;
 b=nMihR0wqtFZUwqe0LY26KdjyGU/MTTjNoFXg6bQD4LV2XJjhYjEGqqoymXzAru9YV2
 AWnSVE0lvQNbOQ9oa13RmtWXUqE3qTxbC8c+ZBj3Hi79qlo/NomYicWAp36togVgGCO2
 nmtrTHBqoDoavNqAJmfTEpcJF0uGQ5UFW8FXmiJSVPVhOpCUmTM/f5Drp+coBkec6wv7
 i+8vYmW+lbKTWiXIago9ZVLcwVX1og6dz82ThwMzly/j/A4tdMgzvrnGVNxkHrwHceF+
 GNOf0pxg4iKpYv5MJ+Hf/xWWSwblJqxlh4r8p/krzT7pljmV/84p1BPfL+Y1Ikmm6T0a
 /Aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776147907; x=1776752707;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nn/jzAhs3EapmDwfSpnGwMa8V3xee6nP93fBFq6IzPs=;
 b=FkmJ5Qc1b/5ItxZKhHCjWP7HljHEjmDp8MT1jI5K30wZ8m9gDJcnhVsoMrUPwltl+r
 BJajdTS9tQmPngWY7+Fu+E1OnpRqitouCN9YMLROhMFabtyYRDYADDIxczp7gUMlGCBo
 NrEDwST7xfEXYYPkMGeAv2YnWMFQc+6kunafZLZNZvWybGlkq4YPHQsDRhymO9tzbjeR
 JDBZ0oy2avYxd33bxCXJJ6nqFmAhUiw4wbjC7Ta937/qmR8yCS56k+mbZ2ZGWGPhUtdN
 X9z+Wl326MLI9zPelL/HOPp3B+nOb92cXZAKxnO0if9ZuZR5o+/wyeTQkfMqDvxY6t1z
 Y1aw==
X-Gm-Message-State: AOJu0YwjJmIikWa0r2Ogedq4/jAqmQ1LLFxz2BCucCmlpWZPIEann7Gn
 d5y+iIUOK5wZRXKgjuBF+V0heXXqaUYk/zltrLRZJGWv1ljOwU1IHHQAXRkq/qgwen2j/U2X6UQ
 rCrpL8eAKwdxzEfcoCfpTA5dvLR2qsqYC+keorQ0=
X-Gm-Gg: AeBDievlhShoSlCP3eED+tPMdNdXMCrG/CBFOCEGv5Acm1BgJ1deAJNITg0xamMgQ2J
 euvArMm6Bj+B2AaJju0O2UNNtBHhDHLAlYXUyC5Ez9k8jGJasHM5STh3pbi6/0cM0j92VjYdheZ
 YurTK8xjEuuJvFZpg8bSeVNr6HMbza+Ii86XEMIQeDiS+ZzZHEXwD7RPDYoVOG+39j+Icf05QHO
 eZhVqZlpBaJRfN+AZNFKx8XFaUGLIwjvYit89cRJwZwTc1JM2bybSNEaRfA97WPEJZ1KlbSGlLr
 yk3S5JYHAA==
X-Received: by 2002:a05:7022:699a:b0:12a:72af:83d1 with SMTP id
 a92af1059eb24-12c34ea9cffmr8732916c88.11.1776147907277; Mon, 13 Apr 2026
 23:25:07 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?7Jik7ZWc7JuF?= <oho790114@gmail.com>
Date: Tue, 14 Apr 2026 15:24:35 +0900
X-Gm-Features: AQROBzDxwjAf5VxsaCh-1LvkyvN0cEV3WOFn0_15HUV5_YHugiAoqk11QEkomzA
Message-ID: <CABJHARAXnDWhXPBs6zQa+CDM24VXD+u_GREuE4GEYHyXT_AoPg@mail.gmail.com>
Subject: WireGuard Windows 0.6.1 - Existing tunnels disappeared and ZIP import
 not working
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 16 Apr 2026 02:18:32 +0000
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

Hello,

I am reporting two critical issues after updating WireGuard on Windows
(version 0.6.1):

1) Existing tunnels disappeared after update
- All previously configured tunnels are no longer visible
- The Configurations folder appears empty:
  C:\Program Files\WireGuard\Data\Configurations\

2) Cannot import new tunnels (ZIP files)
- ZIP configuration files are not visible in the import dialog
- Even using "*.*" filter, no files are shown
- The files definitely exist in the selected folder

This issue is affecting multiple users in a production environment.

Please confirm whether this is a known issue or a regression in version 0.6.1.

Thank you.
