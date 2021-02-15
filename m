Return-Path: <SRS0=kgOq=HR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCF1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Feb 2021 17:59:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B82C564DEB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Feb 2021 17:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B82C564DEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openziti.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88a15842;
	Mon, 15 Feb 2021 17:59:20 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1ff7c81a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Feb 2021 13:32:57 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id z9so3929687pjl.5
 for <wireguard@lists.zx2c4.com>; Mon, 15 Feb 2021 05:32:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:thread-index:date:message-id
 :subject:to;
 bh=3QVI07sEfvfDepnXF/rD9AS8gSUmMYVB4U8Ly0ZZROA=;
 b=oObFQjZ1SDa391xbDbuNwCX2PrrxcEV9bmtrXUB1frpZxutv7x39+7gvmojgQ9aPD4
 wImQ+eG/4560hxYFEAOX6D5ikIjzZ38cfyvLCLujoWX7LeaKQ8WKsT38VmYODLMQ9leO
 LCISr6FtI4vn4MW4W8NWCM8ZBLAHAuRo0KyhAsBXM0cVxD4YYZOueEKIcK9QTW7ubnXh
 Mqzt4JDMLlwcYz/HKFuTxLkwiOGSSZeKK6oETU75NMs/R8g2mjz6wztjNRQcaEuBNn4Y
 //TztwSkE+MDiHIpAeBR4W1bC1QLqN0jLsWAWwUwq49Raea17WJOKRTB0MZV2tVSHAFg
 z59A==
X-Gm-Message-State: AOAM530Jcg6/dfJG3oZWKFdp5V/Dkoh5FNQQgH5M6qAW/Juo/XtlRChl
 ddvYab6mnCipvytQoAaPg2FncebfPyNchA==
X-Google-Smtp-Source: ABdhPJwTKoEPPIQprVxhQcktOScI4N7mGRYWALtOZMXNCmUZZsL0RfnPiCWcO52hwxBwkLacUQ1/Pw==
X-Received: by 2002:a17:90a:6383:: with SMTP id
 f3mr15659580pjj.14.1613395975056; 
 Mon, 15 Feb 2021 05:32:55 -0800 (PST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com.
 [209.85.210.174])
 by smtp.gmail.com with ESMTPSA id y23sm16062687pfo.50.2021.02.15.05.32.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 05:32:54 -0800 (PST)
Received: by mail-pf1-f174.google.com with SMTP id q20so4182534pfu.8
 for <wireguard@lists.zx2c4.com>; Mon, 15 Feb 2021 05:32:54 -0800 (PST)
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr14671305pgt.74.1613395974376; 
 Mon, 15 Feb 2021 05:32:54 -0800 (PST)
From: Clint Dovholuk <clint@openziti.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcDnlGep04h1fznQEi+3bekU6B5bw==
Date: Mon, 15 Feb 2021 08:32:52 -0500
X-Gmail-Original-Message-ID: <b17cf1b329499660a7f242671b8f8114@mail.gmail.com>
Message-ID: <b17cf1b329499660a7f242671b8f8114@mail.gmail.com>
Subject: Wintun changelog?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 15 Feb 2021 17:59:19 +0000
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

This is not a wireguard issue/question, this is one for wintun. Is there a
changelog for Wintun itself? We're using wintun and we're seeing some
strange behavior in windows around DHCP somehow not working. The individual
reports that turning our software off (which closes the wintun
session/removes the adapter) 'fixes the problem' but an ipconfig /all taken
before this action shows the user having no valid IPv4 address. They have
the 169.*.*.* assigned IP.  Our software doesn't/shouldn't interfere with
DHCP at all and I doubt wintun would but I did notice we used wintun 0.10.0
and 0.10.1 is out.

I was wondering if there's a changelog somewhere that I didn't find - I
checked all the regular places but just didn't locate it. Hopefully I didn't
miss it. I expect to read the commit log to determine the changes in
between.

Thanks
