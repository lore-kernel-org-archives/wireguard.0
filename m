Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C715C43214
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:12:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A06D960F45
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A06D960F45
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 827c5947;
	Fri, 27 Aug 2021 14:11:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f8391d20
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1630073488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hMPulJcamXKMvcZ6rmfpX90hXLhbx5YpM6U23vMFBPw=;
 b=DTummYIKBFX190XIDIwhQwpRVYHkI0+p13e7InvN/zMEMOszF7yvHkVyE5IwM8KnfGe8ME
 QZecVSuSx9+HIgnIeXGii2zJgswqBCSVs70L6cfdBOw0jCDhwRaB6M8uYZjlOib9xWU4C5
 8FGLhmL9K/XQVrPoUjo6eDXWsWNL4KI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0772c964
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 14:11:28 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id o204so2822922ybg.12
 for <wireguard@lists.zx2c4.com>; Fri, 27 Aug 2021 07:11:28 -0700 (PDT)
X-Gm-Message-State: AOAM533bmE4IsV/Fo4L51Z2ICGqKP3hZXsLnLLslR2FUjTxG9HH9jjFg
 dgg+SrjKyO7+5PsMs8I24Mz8a3P+STNlStjcMBs=
X-Google-Smtp-Source: ABdhPJwu8XpATbUpdr3GwqaH2GTBMQ0MQp9lmL7tLz/aTNsmwsQYzp7v1N0GY4Di28ncJY+cBpnqojBnw2gaKIRKVD4=
X-Received: by 2002:a25:be09:: with SMTP id h9mr5993950ybk.239.1630073487902; 
 Fri, 27 Aug 2021 07:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <CABK1yFAx0mLhx1jj=WmAfLewvzea6n4hwhabY4RNG137smBiFA@mail.gmail.com>
In-Reply-To: <CABK1yFAx0mLhx1jj=WmAfLewvzea6n4hwhabY4RNG137smBiFA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Aug 2021 16:11:17 +0200
X-Gmail-Original-Message-ID: <CAHmME9ooDHz4-o0EZzNu1bHOrqDn5NNz-Kv+7Y2B4hLbff9nng@mail.gmail.com>
Message-ID: <CAHmME9ooDHz4-o0EZzNu1bHOrqDn5NNz-Kv+7Y2B4hLbff9nng@mail.gmail.com>
Subject: Re: wintun0.13 memmod load fails in windows10 (wintun 0.12 loads fine)
To: Gopakumar Choorakkot Edakkunni <gopakumar.c.e@gmail.com>
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

Update to the latest wireguard-go commit.
https://git.zx2c4.com/wireguard-go/commit/?id=bad6caeb82edd0e22bdbcfa1ca544a5805109e14
