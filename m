Return-Path: <SRS0=uc8W=KG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC84FC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 14:49:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C227661263
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 May 2021 14:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C227661263
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6404bb09;
	Tue, 11 May 2021 14:49:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cf5c5de5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 May 2021 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1620744565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=30K5Qy2ynTsKUddhvjOj1mR/mR2RaX/w63HD/14tr1I=;
 b=lEDlokR02qsqdmHbIGcq/uqgPioTi9GT6qcO/WQYB+1fCMiOBjs//k++SlqMcNn3ogkMf0
 3i2Vs5UITEdzbNlN4zSUSvgZpgkJFcV3EyAG5G1YmMgqnElJ1X0k+gx6YQ7QGw5qlSfGCN
 RBgsYUvD7pWYf800vVb9qbHJjbVDFiU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 713977fc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 May 2021 14:49:24 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id v39so26661197ybd.4
 for <wireguard@lists.zx2c4.com>; Tue, 11 May 2021 07:49:24 -0700 (PDT)
X-Gm-Message-State: AOAM5334BEGcHkKJcSV76n9a8O6XvOXz7OtbRl2W9aglMAymHzlRWZxg
 9YolKw0bLJzZ2MMsdcd8bMELwEAAztTZkwo1hyY=
X-Google-Smtp-Source: ABdhPJwUJDe0hmI6fpF0FYP8PcorFP+VZjH2HybzeEqOxeMteVymIdLl9LLTodh++L5HCRRVAn4++ZxLHiQnSt7ETE8=
X-Received: by 2002:a25:dad5:: with SMTP id n204mr21194755ybf.20.1620744564258; 
 Tue, 11 May 2021 07:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAGYZcps=qdWvwsed+kRY90W-7d9N09tiACRFj9yMy6OMXe9znQ@mail.gmail.com>
 <CAHmME9r6sKA=RCpCxDESVXy5zGQyPQwQJmBiDf+rzzFDHRHsQw@mail.gmail.com>
 <CAGYZcpuLkrruy7Eh4QoM-mEESXCpe9dcMK3b85Z5BQpEOJdugw@mail.gmail.com>
In-Reply-To: <CAGYZcpuLkrruy7Eh4QoM-mEESXCpe9dcMK3b85Z5BQpEOJdugw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 11 May 2021 16:49:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9rVFrXbzemLM-cbtzxsqorLRWSqH2dG-=q6K6jTYL84Cg@mail.gmail.com>
Message-ID: <CAHmME9rVFrXbzemLM-cbtzxsqorLRWSqH2dG-=q6K6jTYL84Cg@mail.gmail.com>
Subject: Re: [PATCH] Windows Bindings: handler for WSAEMSGSIZE added to avoid
 stop receiving data
To: sascha@dierberg.de
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

Hi Sascha,

Oh, boy, that's embarrassing. Fixed here:
https://git.zx2c4.com/wireguard-go/commit/?id=5846b622837e04dbc35b153d9ceda7fd66397520

Thanks again for the report.

Jason
