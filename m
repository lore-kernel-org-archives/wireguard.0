Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C13C32793
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Aug 2022 13:48:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c9ad98e4;
	Tue, 23 Aug 2022 13:36:05 +0000 (UTC)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [2607:f8b0:4864:20::935])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 164a2fb3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Aug 2022 09:26:46 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id ay32so4772227uab.5
 for <wireguard@lists.zx2c4.com>; Tue, 23 Aug 2022 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=4vhf0qLr3pO0cIpBItzL/KwOCExvKIVI1qer/UPAs0A=;
 b=qT2R3b3BUJM/LyxwDtNBFfCPC7HCgFqvrCaVoibVFntZhBd4IdZfXMwfHkO5PQ/71v
 7Ix+kMdJxdEJBuM7OwnYw+M+bERfzfL8f1SePiW1HQRjoNdEega2AVJZTNyoqyQLXl14
 lBI6Gi3ZFC2g27jKFOZ3aihscx7pzlc5pyZWyFk8onHftnMFMFGl1R06Xwo6D64XaDv+
 acCHlQnY3T04gOxPnUqI+XYpPTr5Nkk8MN8qZt58D3lr8MxN7XiCuhCebF35yCcQDlmM
 dy5Cuf7l9QHIHX7mmgRwE7dvbe6AJbw4Mz0uOUjhHhke4U2PxzZBiOUGmupMs3YV/4k7
 J42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=4vhf0qLr3pO0cIpBItzL/KwOCExvKIVI1qer/UPAs0A=;
 b=3ZxnjRL7U4H8Yn+akGhS35mBDu880QzVeCf3iHMkG33i4styEhix0xQ2BJT4pL7Cy4
 owEHWAwziUE1R3hh5VcsEXKsUSaar6a6+xwESkmu3DZLGh3IAxAoQk86oOlhAJFkrO3r
 ESj3tEG3a5QiLhCqXi1JyLAwcwLablyHhK0f5WhPLUvpfmuMHiPx/6sBjvt2u6EfKLuD
 FG8YDfesmBS/GP3qz8MPTpLMqCCFTdplIvpf2z3b7byoBOyXyd96r1WuwGyEWtXONZE6
 kzb6smfP2/XmXMbqoHsR+BdOmE+BlR7hHTXEyQoLYMbps2uG7BWbMxrbkDG3CyRXgnmy
 WBrA==
X-Gm-Message-State: ACgBeo0pbdmqwdeLWZNJyUIYSIeXEMadEtft2DItbkz6WQDAk91Gu3lI
 IgA9DqPhnLKHusyq0/eRcJOX/ui8p1cVx9skrcW56nIA5Ds=
X-Google-Smtp-Source: AA6agR45T0Zfnj0gFlgVdGPeNeiFF89RzW/gyq6qRwo6rMDHIz4PQItT334U9ReoQ41Z/0oi96LL5M/2TJZ0jqr8iNk=
X-Received: by 2002:ab0:134d:0:b0:39f:1489:f61d with SMTP id
 h13-20020ab0134d000000b0039f1489f61dmr1903615uae.14.1661246805131; Tue, 23
 Aug 2022 02:26:45 -0700 (PDT)
MIME-Version: 1.0
From: Michael Pro <michael.adm@gmail.com>
Date: Tue, 23 Aug 2022 12:26:21 +0300
Message-ID: <CAA+Mow79-=J1LmFWdFOEnVnV4QCKyWb13YsvzOrsxtWV=GgJ7A@mail.gmail.com>
Subject: FreeBSD current socket-src changed. Wireguard not compiling.
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 23 Aug 2022 13:35:50 +0000
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

Tonight after updating kernel freebsd current I got coredump with
wireguard enabled kernel module.

As is
https://reviews.freebsd.org/D36232
 D36232 protosw: refactor protosw and domain static declaration and
load (freebsd.org)
in wireguard-freebsd/src/support.h
...
error = (*so->so_proto->pr_usrreqs->pru_sockaddr)(so, nam);
...
replace to
...
error = solisten_proto_check(so);
...
Recompile - no more core dumps. All works now, perhaps...

Is this the right way to fix the problem? Is this enough or should we
wait for a full-scale refactoring of the code?

Thanks in advance for your reply.
