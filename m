Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218FAC3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d548793f;
	Tue, 20 May 2025 19:34:42 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d9382074
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Dec 2024 01:23:34 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2155c25e9a4so37235ad.1
 for <wireguard@lists.zx2c4.com>; Tue, 03 Dec 2024 17:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733275413; x=1733880213; darn=lists.zx2c4.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+7qu2OdkMDrWyEA/AbNp/Eldt4Pq/+jBPwLnQKSEnQk=;
 b=K/RX9tPu8wf5kP+qfi20Xa5xCdiEIqbMnomZffnXtcILSQ1gw+G6aSrU7/5BvaYMY6
 7G3PqpYAEkS+5CSAnXKUoxfy3rwj/0a9fx+tBCOIgG4EuNcLw26hCpLSLatU4AteyeYF
 e9RkEUwHOkQbBRCxPHoY8pUpwMlbm+OHrBTpyYx255v3KBPXxdKii3692QONBm4St0DN
 xQuboqViMz5ZfeCpkdK8Xb83H8qWajbikCPH7KqGrpr1BL3zLH9fpQyMbssQwl+ctWzT
 FkpzeBYfe9U0iAjMSmVhWt3iKVWSfPo0H6jLne229R+HOc4masrvD37isdvxx1T2vKpG
 rTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733275413; x=1733880213;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+7qu2OdkMDrWyEA/AbNp/Eldt4Pq/+jBPwLnQKSEnQk=;
 b=S4ajuG+cuo50HUAZEiSMoxfLsC3a4SuOeDT4p564waGZVWPR9LKAAk8pSj3fac3rAe
 Ke1AF3Nuum10UpbnzSWGsJDzHo6Xk+9aajSjRH9YeDy/0QaX6PZ3lNjCCoVE3nq6ScLk
 6m9LQSql/AIbmxlg71D2nUp/2apGpAmpZ3WOAlYtww5zIBBwWLS+IgDGS0r5DWgVB4fy
 fvSeK9bGZkspFvNO9eZZrN966E9cch140wsJroTmCdUSyHds9JSj+m4KHZsha/sEvaAY
 r0ohTit6oteXJMleTvPD5ZpBtNSHArns34kwfh5jN17qrx2PKlq7Qwq8jBNQo5m75tVu
 Y9Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXkoTfU2fVk84Ke/8hUh3Snm+4KZKJFUxkkDAH/UjTj1m0c/adgLJ5uHqi7RhOez8LGG4ZtXrC9Bk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyZmI2X7AETLocq+l/bSpNjUZRbZgB7evxPFISB0v08ZQPQFKMv
 1Li/SVQ+4I9bKeRxiezB4qyleec0vcCiW9pVCmWLROi435tOEpS2zfKwC5l7aFLs70oKQq1wDbR
 QhXvnN43GujDu9eSId0Hjyy9OPseGU4XTB1a4
X-Gm-Gg: ASbGncsoH9RJSZf+ZF7UtHC11zNcm4TN6nZtiSbzgSzQFSAmcMeWqZ9HMKAaV5KlDuJ
 bI+es651YD0rUDWWsZxLA53sDib2SwegM0ZPdgWksKNQJIEuQti2YkPOaNfx6fQ==
X-Google-Smtp-Source: AGHT+IGD28NPEj4py7ZE6t7UOPJEzjj4CwV1nKf1e4xWMi3ISwCNz9WuJpdVSU42ZLi15gw0WaF/NMUP2mbpoyKo0J0=
X-Received: by 2002:a17:903:2a83:b0:20c:e262:2570 with SMTP id
 d9443c01a7336-215d6c3ec59mr1174565ad.8.1733275412322; Tue, 03 Dec 2024
 17:23:32 -0800 (PST)
MIME-Version: 1.0
References: <CADKFtnTThMBDKCXufNaeci5uCeddOgLvXmqszyJoT6N=6xtWug@mail.gmail.com>
 <20241127232133.3928793-1-jrife@google.com>
 <20241130095624.1c34a12c@kernel.org>
In-Reply-To: <20241130095624.1c34a12c@kernel.org>
From: Jordan Rife <jrife@google.com>
Date: Tue, 3 Dec 2024 17:23:20 -0800
Message-ID: <CADKFtnQTWLyTej3cf+SJMWHNMPvZetfW9pUMH0K-tBOGxXLZRA@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com, 
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
 shuah@kernel.org, wireguard@lists.zx2c4.com
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

> Better still use NLA_POLICY_MASK() so that nla_parse_nested() can
> perform the validation and attach a machine readable info about
> the failure.

This is definitely cleaner for the new WGALLOWEDIP_A_FLAGS parameter.
Thanks for the suggestion.

Applying this to WGPEER_A_FLAGS would simplify the existing validation
logic as well, although I think it changes the error code returned if
a user provides an invalid flag from EOPNOTSUPP to EINVAL. I'm not
sure if there's anything relying on this behavior. I'll let Jason make
the final call there.

-Jordan
