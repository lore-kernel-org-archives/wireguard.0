Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E40CC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Apr 2022 21:35:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 79b67119;
	Mon, 4 Apr 2022 21:35:06 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2b578fce
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Apr 2022 21:35:04 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id c15so14644260ljr.9
 for <wireguard@lists.zx2c4.com>; Mon, 04 Apr 2022 14:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=mkI/iMlTi8h78uskdeC14d0gj/jksLpcfIiVcU0xZek=;
 b=a2dMcB8pBGiCT6dH9djrjLc6UuhW/vdqJgrm4BxTpwokZRIC4HVKT8AfLSMsQqZikm
 9Wb725GWeDfREDuaqvJzKIipObGY1SnHVyxjLAerEhbeHyH3wRCsANH5HKEBHF1I3KeH
 rFksp/mRPG1H5scVDaG6xXwgS8iDcXUFE7W+4ThwDItuIaGHdizveuRfr+BhRnj3twou
 vcGPTcHWLK2OVBlJYBItlbvtiwmsUoInSM+Fmw5g+K2ORWhjqI+ctyelkkUsmYjlPKhN
 pJDC6n1dUuFsNOpG7kdD5G4VY+1/kIf81hOdXSexmeVQtUPQv77WilCHJ3o2MkZo/eKS
 zNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mkI/iMlTi8h78uskdeC14d0gj/jksLpcfIiVcU0xZek=;
 b=0cwvNFbL5q3lxkhJiLFueMCkaxTrkjzDDlgjlunGCf8ucJMNqhpkfvuc3a+M5AJxuo
 gF0ioS/S9gCyNvt8J3pArBSIVVA7xgEhk0h6svLW6dgbc+hJ0dWT3CWbcwPVZPCmoo/w
 IZwEWa0hsSAbNJ1blyNRWLk28ysjNE/1oz64kmuSWXhS0EtPubGmzCwXp8Q5gRxfBxPl
 Ba3EBuTuQoZE5T4KMX3ZStS1Y+OqVYEO6vkkv8isBJ0/GtczAWVihcejUnTsJ3+isIAB
 uqpcVk8EScm5LX+d/WwhJNT/Ll8zLzI8HZiUJYYbsQQpW3J9UiN90nS9aAn3wPSvQC4n
 5geg==
X-Gm-Message-State: AOAM533eouZlRFenZvPYhI8xoQy6unJ3jacQCqUVPSdclVXNzxbj2KiO
 CFLnA8MfwK+Ca1F/kc8MeaG8aqmbVkZgU8zrBNHl1lLI
X-Google-Smtp-Source: ABdhPJxnROrZw4ByX4HVOLIuQiqrrvZZ7EDm3WMU4Y2zemF4ce4xisX9IqB1Y6f3kqUb/lbUfQUT5nizdF7kenmJ894=
X-Received: by 2002:a2e:bf1d:0:b0:247:dea7:f657 with SMTP id
 c29-20020a2ebf1d000000b00247dea7f657mr66648ljr.454.1649108103877; Mon, 04 Apr
 2022 14:35:03 -0700 (PDT)
MIME-Version: 1.0
From: Devanath S <s.devanath@gmail.com>
Date: Mon, 4 Apr 2022 14:34:52 -0700
Message-ID: <CADjMg7VSw58f+2Pj9_aJOupVPcAneVA9DDbmVLGEVpZW_XY2nw@mail.gmail.com>
Subject: wireguard performance
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi All,

We were trying to test the performance of wireguard on GCP and found
it around 1G for TCP and around 500-800 for UDP.

Plz do let us know if there are any ways to UP this performance.  Any
suggestion is appreciated.

Regards
Dev
