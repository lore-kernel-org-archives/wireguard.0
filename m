Return-Path: <SRS0=L39c=CA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13E3C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:01:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3985B2075E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Aug 2020 19:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3985B2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andrewjroth.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f2877a5;
	Sat, 22 Aug 2020 18:34:38 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bd17ba08
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Aug 2020 13:38:35 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id o184so876119vsc.0
 for <wireguard@lists.zx2c4.com>; Fri, 21 Aug 2020 07:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=erh/COXVHi4ToUm1G8mRLzSTy84yazl+gtWpB3GgZ5M=;
 b=jRhxqyp4nDi3pG1AgqerPJOBDH46Msg34jt6XsAEv1rEJs2zW8KNzHMoAoozxExaB+
 uwMXsiVpvh0xn0gDnrX3WQTbQnnFFZ0qNY5NRZRZ8cMh/atlDJXYsOkDJ0YobtdDWpHd
 pHeT1I3V6pgTMXKj88gsM7oStBByKsWyheIQDrRcZEsh3WzEIVfXIvmBpcHWMijX03A5
 JIuO2RFW9agd2WqmkI41fLtXfPPwKD8y9pYMT1fPOiS6coXN3H74fl2vJqi5WG5VXCGU
 IF1NdDwKjb6CYiAm8zfZNlx65Cd+V9NhGBFPpmo+WF3e66r4Lh2E1Xaj9el2+zwoNEJZ
 tQ2Q==
X-Gm-Message-State: AOAM530vMegD/h9HlaTHBFBv8yBGZLRfY4rEsRFt1ZP3RBx/0a7o6H9b
 6KGL9YXFdNLtG3ZzD+PnoLqoQaMdzL6+2/pKVEktgaSWf1IejA==
X-Google-Smtp-Source: ABdhPJwNl3Z5rJxfOR3+xOw9sZB9T4qfDlVog4/RBrzewr6AbfGzoVRseLfsb9ZIejD6Z3jNPwoF/+gR6l2s/mDx7Ps=
X-Received: by 2002:a67:bd11:: with SMTP id y17mr1772644vsq.120.1598018708552; 
 Fri, 21 Aug 2020 07:05:08 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Roth <andrew@andrewjroth.com>
Date: Fri, 21 Aug 2020 10:04:58 -0400
Message-ID: <CAF-5xiCzvHFLtLFpw5FNOR5w7=bEBNjDtVgedRjGNzBigk4cZw@mail.gmail.com>
Subject: Python Wrapper for wireguard-tools
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 22 Aug 2020 20:34:36 +0200
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

Recently joined the list, but reviewed the archives as best I could.
I figured before I get too far in writing this, I should ask here.

I'm looking for a way to create and configure WireGaurd interfaces
programmatically using Python.  Has anyone created a Python wrapper
for the wireguard-tools?  If not, could I try my hand at it?

In my research, I was not able to find any true libraries supporting
configuring a WireGuard implementation.  Since wireguard-tools [1] is
cross-platform, and Python is cross-platform, I wanted a
cross-platform library to configure WireGuard interfaces.  This would
help application programmers or tool developers who want to utilize
WireGuard as part of the application or tool written in Python,
potentially cross-platform.

I did see wgnlpy [2], but don't think it is a fit since it relies on
Netlink (Linux kernel interface), so it's not cross-platform.  I also
found a few other packages on Pypi, but none of them seemed to
interface with the WireGuard module interfaces.

In the wireguard-tools repository, I noticed the embeddable-wg-library
[3] with C source and header.  Python (using CFFI) supports creating
an extension module that is compiled from C sources to directly invoke
the target C function [4].  It claims to be fast, simple, and
platform-agnostic (by that, I mean it can be compiled for any
platform).  I am planning on writing a python module to expose the C
functions from the embeddable-wg-library using CFFI.

Does this make sense?  Any comments, gotchas, or limitations?

Thanks for your time,
Andrew

[1]:  https://git.zx2c4.com/wireguard-tools/about/
[2]:  https://github.com/ArgosyLabs/wgnlpy
[3]:  https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg-library
[4]:  https://cffi.readthedocs.io/en/latest/overview.html#api-mode-calling-c-sources-instead-of-a-compiled-library

--

~Andrew Roth
http://www.andrewjroth.com

"Our greatest glory is not in never falling, but in getting up every
time we do." -Confucius
