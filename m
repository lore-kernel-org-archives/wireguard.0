Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76525C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Jan 2022 14:56:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 45091140;
	Tue, 25 Jan 2022 14:56:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2b08edf7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Jan 2022 14:56:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F8E161615
 for <wireguard@lists.zx2c4.com>; Tue, 25 Jan 2022 14:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1974C340E0
 for <wireguard@lists.zx2c4.com>; Tue, 25 Jan 2022 14:56:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LJvAO95L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1643122564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QIcfyGrpIBgZ6FiNoiMZgRTqJ/7C/zh/Tf4MaEP/FNw=;
 b=LJvAO95LpLNrzcDbo8jzpGzATB7qN3+KD/u9Uc2ADdBBG5SXVMDcEJ8i8v/sDhkMjuEpOB
 F+tDVZpIV7I5/vD6aGhZAVNt8DTj8rxr9QMmadMJ5DaaQmj5nN8eZaN9EjrbG1tA/Bbbsy
 hhpzdqca0hlEQ2Yr45Hhs61QzA6XHhc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 647b39b4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Jan 2022 14:56:04 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id h14so62413256ybe.12
 for <wireguard@lists.zx2c4.com>; Tue, 25 Jan 2022 06:56:03 -0800 (PST)
X-Gm-Message-State: AOAM532f7KxBmdSUz0fAu/+ren0BWkkEO7JzzAvc1ZbzoOwRh83XcsRZ
 4jYllpgxlmrAhF98sw+tmbkgOTYphAUNn7XChYM=
X-Google-Smtp-Source: ABdhPJzjq1RDG4ZYUU/S2mptBE3igfkr7Nc8xJ2eaw83I9GqSzjrMC1WwxK3p0JI8qx6PPaO/aSCKX06iOpPGe65dd0=
X-Received: by 2002:a05:6902:1105:: with SMTP id
 o5mr16613402ybu.113.1643122563186; 
 Tue, 25 Jan 2022 06:56:03 -0800 (PST)
MIME-Version: 1.0
References: <CAMTfdYou8TjP0TikezEjSWG-Rxtb8JzpPLcKOyOmE8B9sQpi8Q@mail.gmail.com>
In-Reply-To: <CAMTfdYou8TjP0TikezEjSWG-Rxtb8JzpPLcKOyOmE8B9sQpi8Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 25 Jan 2022 15:55:52 +0100
X-Gmail-Original-Message-ID: <CAHmME9oPom008GYkORba_99g75Sti0WA+is2azvtONw3CnU_iQ@mail.gmail.com>
Message-ID: <CAHmME9oPom008GYkORba_99g75Sti0WA+is2azvtONw3CnU_iQ@mail.gmail.com>
Subject: Re: Contributing to iOS app
To: Alessio Nossa <alessio.nossa+list@gmail.com>
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

You can send them to the mailing list, or I can give you commit access
to prefixed branches. I'll contact you offlist for the latter
mechanics.
