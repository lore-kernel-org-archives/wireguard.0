Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B12C43215
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:40:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1704E2071E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vIrFUhXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1704E2071E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fdb9e88;
	Wed, 27 Nov 2019 12:40:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08f49a3f
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:40:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23279ddc
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:40:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56c685fa
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=8uSVzYmFnOzoTuac7gPcnknTUCw=; b=vIrFUh
 Xd5P8c0nIQcmXDwhaRYTggV649/u6c61dhFByVcNc9HdT8iHCbTxSGPWbWet/JLx
 Lv8FMWypTWfOuSRJ+XAkUx4OwcO2gY9WU0hQC6zWY/obYEMJSTJ95Hcl4V4jzJS3
 GwuYS6BdYMOu1+6jMSh5aO8KXCqRmzBhAlq1EUfHX2vxhjj3JAtV21WPkwFAQNhq
 gAQ0UGitKSPDFQb+ibWseUMI6hfwf400bybOwUt46zo41b1tfRG1Bl51VAk/x8h2
 xloq+ct8D5d5Pj4EcCghSJPqd4I6LcSbN0404TsBSWK303lelx2dqxG1VW9Zpr3i
 NN3hfziQc5MFfcaQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ad0a15ae
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:46:28 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id q23so13151692otn.0
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 04:40:19 -0800 (PST)
X-Gm-Message-State: APjAAAW5TVmI1UM+Aq1h4X23Wl5v4NkRfnCXqRSHmu3Yjvtqy+MeWsm8
 3tBwPMPl92ruLcnE/PuaP4kqqj+JQ64DSB+yTFo=
X-Google-Smtp-Source: APXvYqyEL7Gaip+Ed+WWag/Fa6qcmzkQXDUdTCmXyW+X1Psi1eF2ewMEbQ+nr1KQhmZEa5XMGTlrGp205vLsdH1IxPo=
X-Received: by 2002:a05:6830:4c7:: with SMTP id
 s7mr3572656otd.52.1574858419146; 
 Wed, 27 Nov 2019 04:40:19 -0800 (PST)
MIME-Version: 1.0
References: <CAMi2xeQs3hCB9DEZZOZMUQyx6r_HT6Qh_MAnBgNvhOmfJvrChg@mail.gmail.com>
In-Reply-To: <CAMi2xeQs3hCB9DEZZOZMUQyx6r_HT6Qh_MAnBgNvhOmfJvrChg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 13:40:07 +0100
X-Gmail-Original-Message-ID: <CAHmME9rhLSieSQ-Co7KKR6hfC-RGyaLA_TGpmYPObzJYMe5rDQ@mail.gmail.com>
Message-ID: <CAHmME9rhLSieSQ-Co7KKR6hfC-RGyaLA_TGpmYPObzJYMe5rDQ@mail.gmail.com>
Subject: Re: wireguard-go data race in Peer.SendBuffer()
To: Ben Burkert <ben@benburkert.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks for the report. Does this fix it for you?

https://git.zx2c4.com/wireguard-go/commit/?id=cd26ba8ee4a523437aba3b489422127f1293a16f
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
