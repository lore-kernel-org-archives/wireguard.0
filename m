Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73BEC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 18:01:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B8D64F17
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 18:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B8D64F17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48558836;
	Thu, 25 Feb 2021 17:51:15 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 64c566a7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 16:56:52 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id r23so7293014ljh.1
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=spS3cFMxiiQ6FkoMtfLWD1BQ4H0WOTBzSYKle7URJaY=;
 b=lUiQNjkskaAzg+Wvdn6AHew962VaM2Lc4yKmv3O6N8brHTiuebwUHOoqo/pHhhfB+Y
 /rGnel/H4hsTFDO7KTY+nU/+ubxMsBGfCzSS/CSNT+kSGTKME1grzsmo174EEO54BZZ6
 29wRS3/bdRK38No7JUszhYn6yL48WIH46s5xzSVv0CTlkzLxdZh4yRo2q2JJ/i5MpGlW
 6x5gNheD11j5/OYeao7HwGtl955QHlNntvRscgXVl6q6thcPEvVYfw5DQvNWDh0WqmXU
 k7GOEsQ0ZWvSiyeRK1W0yCgemiNzFFRyF63EyznEZ7IHeYyLpXNEY46o5djJN8tQo6pP
 pvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=spS3cFMxiiQ6FkoMtfLWD1BQ4H0WOTBzSYKle7URJaY=;
 b=pjrSrPMxIIMn08x5/JZbYRsrnI02mhbdvdmIaNAu7zPLCMY1vgufYcBZ8xvGxli2Lo
 BFaXGlGvHHHnb9s8XiSyNKoqo6xBIdek6cnkyQHC4ZyfuKlnr7cFc+Nyw79aGOn+fIc0
 NT6nF45skvfwrE1MEI6CvbxvR0S8W+mUCaq41PVdTZwVlm9E0D0BjblIW6nf4lUFrIEn
 Jmrq08u/07Enfu1kn6/TkUPLm2NvxIIxC1FoRtMiZ0wV8vDzbIKcwJZbjO1lI4IWKOYH
 Cru738uSwAYGYkWo/A8ZWomdTPLNxqgMcv/zKCa97OYRUNZ32QEd1fE2FNOLRNsYAAlF
 ls4A==
X-Gm-Message-State: AOAM532x2aTzlUXxBDyx4fQdvIU9g54/fqL/x/Gpr/J9cQJpfKg6Gdh9
 HvrJ32ws5pnsEobckYHDrsxput0kEwnNyQ==
X-Google-Smtp-Source: ABdhPJy53bvqGKYEELX6KFJ8zfVUjw5n41z3WpDY6CDy57UWCFZKpjgXiH8fkAPd1SFQssva7jdO/Q==
X-Received: by 2002:a2e:7c02:: with SMTP id x2mr2012165ljc.247.1614272212218; 
 Thu, 25 Feb 2021 08:56:52 -0800 (PST)
Received: from [192.168.178.56] (i5E8623F5.versanet.de. [94.134.35.245])
 by smtp.gmail.com with ESMTPSA id y6sm1156247lfy.224.2021.02.25.08.56.51
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Feb 2021 08:56:51 -0800 (PST)
From: Michael Lennartz <miclman.0x0efbd3@gmail.com>
X-Google-Original-From: Michael Lennartz <MiclMan.0x0EFBD3@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Wireguard on Mac not working through a corporate VPN
Message-Id: <80702DEB-2D7D-4B4C-A268-3E4C8FCB746C@gmail.com>
Date: Thu, 25 Feb 2021 17:56:50 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Mailman-Approved-At: Thu, 25 Feb 2021 17:51:13 +0000
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

Hi team,

Since a while already we=E2=80=99re testing Wireguard in our environment =
and I think, it=E2=80=99s a great project.
The focus is currently on Mac clients, where we=E2=80=99ve used the CLI =
version from homebrew so far very successfully.

It=E2=80=99s important to note, the we=E2=80=99re reaching the server =
peer via another (Corporate) VPN interface.


Recently we=E2=80=99ve updated to MacOS 11.2 (Big Sur) on the M1 =
architecture and the (most recent) CLI version of Wireguard stopped =
working:
When I now try to connect to the server peer, the "wg-quick up =E2=80=A6=E2=
=80=9D hangs at the first =E2=80=98wg set utun3 peer =E2=80=A6=E2=80=99 =
command.

Then we try to use the GUI version from the AppStore, which seems to =
establish the tunnel interface and routing correctly. But we can=E2=80=99t=
 see any traffic passing the corporate VPN interface towards the server =
peer. Even not the initial handshake.


Do you have some hints, if this setup is supposed to be working ? Or any =
suggestion where to look at ?


Br,
Michael

