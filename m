Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F2EC54ED1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 May 2025 19:03:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e45864cf;
	Fri, 23 May 2025 19:02:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 67f2adf6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 May 2025 19:02:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0B891A4AAFD
 for <wireguard@lists.zx2c4.com>; Fri, 23 May 2025 19:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E733C4CEEB
 for <wireguard@lists.zx2c4.com>; Fri, 23 May 2025 19:02:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lhy4mq83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1748026971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ob0iRjiM5htZfScEgjZz83aNkaWcRARD1qKHgMMr8rE=;
 b=lhy4mq838AHgJUiRRB5H3C5tU+FJWHYAca9NkqOQBZiGiCFub3urf1g16P18xJvVoaDSwa
 f4V/0P/GGCHDS9ygOzf6ca3Mhpdug3Lvn2XhHXvD0NjLmvsI4/08MH2Oo1oLo3Lib70oBb
 itGoG3Aa4s0dREHZoRFseMDKzzPKlhI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7832cdb9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 May 2025 19:02:51 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3feb3f54339so259844b6e.1
 for <wireguard@lists.zx2c4.com>; Fri, 23 May 2025 12:02:51 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx8QEDFPNWknLpjMeVrW95JKrbwtCLRAAm/dyRTNW/t7QLZLsBu
 PvneBHy5/6BlPIaBCPcA1FZsG4jK/B+Ikf2peeKuSjiVY1k34o9vmkuQaVhNq45U/U0Ycwn4lPT
 KSM9sEzJ9K7KWctsUhvCUE23AzubIb8Q=
X-Google-Smtp-Source: AGHT+IGAA6dYUseKs+C00qNucporGuZ39pEhPLA5OLBnr0PMYDtMP4INPtTEA5YKzYJY9+ehuWkGgFlgKMhJ9UjbMJQ=
X-Received: by 2002:a05:6808:229e:b0:403:5150:c348 with SMTP id
 5614622812f47-406467b15a4mr194600b6e.4.1748026970402; Fri, 23 May 2025
 12:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <f09b788b-d09d-4840-860c-a5bb8b5342c9@gmail.com>
In-Reply-To: <f09b788b-d09d-4840-860c-a5bb8b5342c9@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 May 2025 21:02:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9pMH_2nifjVXukLXucDqbatBy8rG1WA8DWs6k80KV0=8A@mail.gmail.com>
X-Gm-Features: AX0GCFuW2ijFIeb2qDqaF7mOv4gha1wphLlXzCIIWjn_4ROBOrh3LN6wvZh34bk
Message-ID: <CAHmME9pMH_2nifjVXukLXucDqbatBy8rG1WA8DWs6k80KV0=8A@mail.gmail.com>
Subject: Re: wg-quick fails with systemd resolvconf compatibility shim
To: Andrei Borzenkov <arvidjaar@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

Thanks for the report. Fixed here:
https://git.zx2c4.com/wireguard-tools/commit/?id=d3b40aff964789a2a0533cb7a070592a75a996e3
