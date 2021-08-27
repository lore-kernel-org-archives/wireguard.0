Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EC1C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:24:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79EDC61004
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 14:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79EDC61004
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d201e312;
	Fri, 27 Aug 2021 14:24:02 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cde8f8cf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 14:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1630074235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KEjz5evJg2EczOGmSlnq51/PxntQ9pR11olxKUG5rRk=;
 b=cAyXg81SlGRs0E0GALlP2T7npJJxqpDQNwRTlH1B2P9b8ozYThPQU9OjsGi8f9MSDvLchy
 L8Un5INyYHxWSUnj6kW2zq/tiYQhXsKt4FK8sK6V1pgrcbmvnqWI9hhMcur3MnTWde/uMZ
 M2pXl6NhSEIubW8GhEttL/PUK0kiwmQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e3ba8c18
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 14:23:55 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id n126so12827587ybf.6
 for <wireguard@lists.zx2c4.com>; Fri, 27 Aug 2021 07:23:54 -0700 (PDT)
X-Gm-Message-State: AOAM532JIrXPhFQ4LpreHvrnaOouGHU9vELW9etjFRGYEfABu3UnltJa
 lQ+fn98pewdKrAHbuXAUoT2k8Arkewy1oXpJNnU=
X-Google-Smtp-Source: ABdhPJyAAEv+IaW3g9PGOJXFUwNWdyuIi16hioGbKZ45fZSFvFhUo2gxjgBReCrxWL8PXaXjbLJx7mZqXUN1TdnpMxE=
X-Received: by 2002:a25:a109:: with SMTP id z9mr5325821ybh.279.1630074233917; 
 Fri, 27 Aug 2021 07:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210826015847.7416-1-lizhijian@cn.fujitsu.com>
 <20210826015847.7416-4-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210826015847.7416-4-lizhijian@cn.fujitsu.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Aug 2021 16:23:43 +0200
X-Gmail-Original-Message-ID: <CAHmME9qh81gzTTSzVDCxkc2MuLw-PDs7TfnO0=k1smXmK-1Zfg@mail.gmail.com>
Message-ID: <CAHmME9qh81gzTTSzVDCxkc2MuLw-PDs7TfnO0=k1smXmK-1Zfg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] selftests/wireguard: Rename DEBUG_PI_LIST to
 DEBUG_PLIST
To: lizhijian@cn.fujitsu.com
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
 Philip Li <philip.li@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>
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

Hi,

On Thu, Aug 26, 2021 at 3:54 AM Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
>
> DEBUG_PI_LIST was renamed to DEBUG_PLIST since 8e18faeac3 ("lib/plist: rename DEBUG_PI_LIST to DEBUG_PLIST")

Thanks for the patch. I've queued this up in my wireguard-linux.git
tree for some rounds of CI, and I'll send it back out in the next
series I send to netdev.

Regards,
Jason
