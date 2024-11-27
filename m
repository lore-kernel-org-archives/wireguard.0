Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66BFC54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 19:34:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d79635f8;
	Tue, 20 May 2025 19:34:26 +0000 (UTC)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 67504c03
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2024 23:21:40 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-7250da8a2a5so234618b3a.0
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2024 15:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1732749699; x=1733354499; darn=lists.zx2c4.com;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=u20pll8VeOEmkG4npMdzaZzjnGDg+tlkbbf8/K18yaA=;
 b=r4mjoHTdUD0WG0VMGxTxv2e5oOhZQBzKQ1AVP723IbOVXMLhgfdOMEAXztt82rydgn
 mKcO1eLt4rWFUVOLzPOUxv3hkH7o9gzU9WlvcXc27zJu5RV2QgDP60vOgdIhC+qHFPoj
 lkCTSJbHJuqlR6uJLLSUsIDnZAqmPQk2B5+lQA5fotvF6QrCiV0JW1heaWtnJ/bMraT5
 PiF2rxxQHPm0dH/6/V7XMPT9lilL3UIaSCaEQi5LfHHmD37XAwQmR6s8r2uApHPxxlfa
 3QGTjnLkKGtr6uUQ0GNlECf8OTiQxo4CaDGTRbm4WsJJs9WLTLovJ86DrQRtuLnLpcDC
 Lwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732749699; x=1733354499;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u20pll8VeOEmkG4npMdzaZzjnGDg+tlkbbf8/K18yaA=;
 b=YhRy6hzhaOVRTJOXOvLbly52z8LhKpN6cGiK1Bp7njmlUcmQsq10CEc47oQQkbz2vS
 MMESz2muyavwpCgo1yexJtmi+Mzjrov3sbQFeI9GBiOywMfsZejELhPIwgFEe0w1KGSn
 OwxhXoy4O1t7Aa17FatV48CCCRvDqg9yppcpBjXaBa6UMeqYitwaknrfMHH+ZJi5gGee
 OL41mGrMFXlEn5hTLOB7zw0YvcfpygoANoCEjDq6snqZacW7Int3yrwG5SYF1YFQon82
 e9nYYJI3KcB5mQYgkFw0vOkmzZy7iRsPOQ12RmJhOwdQMUblJuxz3Uu9Jtqz9uAjm9EC
 3OHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCjQHmgdd/DTtw8anzl9C4jEVEdT3avWnrMYovkUeOJT1guCd0yjIfsv6nPCXvKqV0hJds7sLwYDM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwNXRhqAZsylXl7f7EvTyO5Jq6nFmK5/tOgIG3S+hqsj+WRv3Vs
 U7bPXrEoXTxTUiEMEpRwW39LTykqQIBB1mYklN9LHJBj9OFIzdrylPcJuW5Sc6hOH4XED3BudA=
 =
X-Google-Smtp-Source: AGHT+IGdqHAFyXe8UNth15Wha1d0C9WQ0r4xWcwWi3yujdz0WVs368myT4JyWIp7ZAc2PFuEv/H+Lq7cYA==
X-Received: from pfbdw21.prod.google.com
 ([2002:a05:6a00:3695:b0:724:f1f4:cc72])
 (user=jrife job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:b81:b0:724:fac6:35f2
 with SMTP id d2e1a72fcca58-725300107f4mr5451899b3a.9.1732749698863; Wed, 27
 Nov 2024 15:21:38 -0800 (PST)
Date: Wed, 27 Nov 2024 23:21:33 +0000
In-Reply-To: <CADKFtnTThMBDKCXufNaeci5uCeddOgLvXmqszyJoT6N=6xtWug@mail.gmail.com>
Mime-Version: 1.0
References: <CADKFtnTThMBDKCXufNaeci5uCeddOgLvXmqszyJoT6N=6xtWug@mail.gmail.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241127232133.3928793-1-jrife@google.com>
Subject: Re: [PATCH v2 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
From: Jordan Rife <jrife@google.com>
To: jrife@google.com
Cc: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
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

> I think the challenge with WGALLOWEDIP_A_FLAGS in particular is that
> because it didn't exist since the beginning like WGPEER_A_FLAGS, there
> are kernels out there that have no knowledge of it and wouldn't have
> this check in place. While I think it's a good idea to replicate this
> check for WGALLOWEDIP_A_FLAGS as well for future compatibility, we
> still need some way for clients to probe whether or not this feature
> is supported in case they're running on an older kernel. If we want to
> keep the version number as-is, I see a few alternatives:

Forget about all of this actually. I was under the mistaken impression
that an unrecognized attribute would be silently ignored by an older
kernel, but it seems that validation is strict.

	if (attrs[WGPEER_A_ALLOWEDIPS]) {
		struct nlattr *attr, *allowedip[WGALLOWEDIP_A_MAX + 1];
		int rem;

		nla_for_each_nested(attr, attrs[WGPEER_A_ALLOWEDIPS], rem) {
			ret = nla_parse_nested(allowedip, WGALLOWEDIP_A_MAX,
					       attr, allowedip_policy, NULL);
			if (ret < 0)
				goto out;
			ret = set_allowedip(peer, allowedip);
			if (ret < 0)
				goto out;
		}
	}

nla_parse_nested() uses NL_VALIDATE_STRICT which sets
NL_VALIDATE_MAXTYPE, causing __nla_validate_parse() in this case to
check that no attribute types are greater than WGALLOWEDIP_A_MAX.

The WG_CMD_SET_DEVICE operation simply returns EINVAL if you try to use
WGALLOWEDIP_A_FLAGS on a kernel that doesn't support it. I tested this
using a patched version of wg that sets the WGALLOWEDIP_F_REMOVE_ME
attribute when using an argument I added called "allowed-ips-patch".

Kernel With WGALLOWEDIP_A_FLAGS
==================================
jordan@t14:~/code/wireguard-tools/src$ sudo ./wg set wg0 peer xK7O/YnTb8W/fgPA4dwAshEV06rMPMqqmy3zZN0NPS4= allowed-ips-patch 192.168.0.3/32
jordan@t14:~/code/wireguard-tools/src$ sudo ./wg
interface: wg0

peer: xK7O/YnTb8W/fgPA4dwAshEV06rMPMqqmy3zZN0NPS4=
  allowed ips: 192.168.0.3/32
jordan@t14:~/code/wireguard-tools/src$ sudo ./wg set wg0 peer xK7O/YnTb8W/fgPA4dwAshEV06rMPMqqmy3zZN0NPS4= allowed-ips-patch -192.168.0.3/32
jordan@t14:~/code/wireguard-tools/src$ sudo ./wg
interface: wg0

peer: xK7O/YnTb8W/fgPA4dwAshEV06rMPMqqmy3zZN0NPS4=
  allowed ips: (none)
jordan@t14:~/code/wireguard-tools/src$ 

Kernel Without WGALLOWEDIP_A_FLAGS
==================================
jordan@t14:~/code/wireguard-tools/src$ sudo ./wg set wg0 peer xK7O/YnTb8W/fgPA4dwAshEV06rMPMqqmy3zZN0NPS4= allowed-ips-patch 192.168.0.3/32
jordan@t14:~/code/wireguard-tools/src$ sudo ./wg
interface: wg0

peer: xK7O/YnTb8W/fgPA4dwAshEV06rMPMqqmy3zZN0NPS4=
  allowed ips: 192.168.0.3/32
jordan@t14:~/code/wireguard-tools/src$ sudo ./wg set wg0 peer xK7O/YnTb8W/fgPA4dwAshEV06rMPMqqmy3zZN0NPS4= allowed-ips-patch -192.168.0.3/32
Unable to modify interface: Invalid argument
jordan@t14:~/code/wireguard-tools/src$ 

The second command fails with "Invalid argument" (EINVAL) on the
unpatched kernel. This simplifies things, as there's no need for
clients to explicitly probe to see if this attribute is supported. I
will do the following:

1. Revert WG_GENL_VERSION back to 1.
2. Add a check for new flags similar to the one you mentioned for
   WGPEER_A_FLAGS.

        if (attrs[WGPEER_A_FLAGS])
                flags = nla_get_u32(attrs[WGPEER_A_FLAGS]);
        ret = -EOPNOTSUPP;
        if (flags & ~__WGPEER_F_ALL)
                goto out;

This should be sufficient. We might want to consider how best to bubble
this error up to users. In the case of wg, "Invalid argument" may not be
very helpful in determining where you went wrong. We could always detect
when EINVAL is returned in response to an operation that sets
WGALLOWEDIP_A_FLAGS and print something more helpful like "Operation not
supported on this kernel". However, these are details that can be worked
out.

Sorry for the confusion!

-Jordan
