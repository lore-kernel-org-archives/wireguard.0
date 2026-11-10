Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE87606A331
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 16:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=LOJ3bbFD
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 67f4d147;
	Tue, 10 Nov 2026 16:32:39 +0000 (UTC)
Received: from mail-pg1-x565.google.com (mail-pg1-x565.google.com
 [2607:f8b0:4864:20::565])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3a2f77e3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 16:32:33 +0000 (UTC)
Received: by mail-pg1-x565.google.com with SMTP id
 41be03b00d2f7-cdb628232d2so1331145a12.0
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2026 08:32:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794328351; x=1794933151;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MuNXC0IJk19PvOjYjcF2JgzsmYbOOaLTEu3Iw97zbKY=;
 b=Mq+0Lk7H+JQedWzRf1iySh4c6zASay08KpLvB1VXBKqXX4jqPeSey4PjGL0nb/7uns
 usC256ELYEUGj1OEXITQh2PgxdsO3r3DhcoECmowWETvxn4VklLA5D57jZz42hMqmLkh
 zP/Atbm7qZxUJLqzBcvKw98NAWxpVfYn64U2CzM+4UtPgB0us7LbiQlC0lQ0rhLBqaFn
 2NC9g9GHiBZmiBhDjyrWBycfmLcUAoZQajhoi5D6ei2Mf+1wsFr6o1aPIQLSQXVoj7Xx
 yGoXfEJiHgYHAkubIPFZexUfLq8R/FoCWavyvlViCTa3zzH1jNru40f0bW4Qyr4ZReXF
 6szA==
X-Gm-Message-State: APuU4Z8UZ3JNWm8UTNepqN7W/OsPUgJy31SD3JvfSXid7ck1IciwWwZ9
 tR5+5mqgQ2MrV2X90smMqei1+SQdA+MRtQsWd0VwPT7IjwPel1SBI1t3Se9xDSlr0B2bxhBocYN
 8ZtbPQYj2q9SNWevCdKW7a/4zDsNFmoJRCUthYzkOLg==
X-Gm-Gg: AYBFou3KFsLfuPU7ve8W++JvvJRiMDrrt1913O+t3/xAbsuRqmNLPz6cH8ZT900FYfZ
 wjWHfIfyaCrBF1ncs/Hu77imW51cn473+OripZpvWg5cLge5u7ORJHmyX9PC/+cwHCzisA3+3JV
 MVyuJKGMXcd8/zA/L90Z3fqWV2zWAleBAA2me0/UOn0oFhhrTwuXp++OoI9gR+DjNOQM9PdNbLz
 8twcdyQUX8ttVai2MBqmPQ3usojiqxSCi+LlBdcdQHIJDGEHEXFtM17ylMXpItGLnCbxLxL4p1w
 fkzgJwiBhij8fzaA9j0M6P0ilinUBlR+48kxnS/ItPtkwzgeIfj53keT8LxzL5m998KQm0WMI1k
 GIg==
X-Received: by 2002:a17:90b:2e87:b0:3ac:aa8d:19de with SMTP id
 98e67ed59e1d1-3b166ae7705mr3521491a91.3.1794328351231; 
 Tue, 10 Nov 2026 08:32:31 -0800 (PST)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3b16910d0acsm863446a91.4.2026.11.10.08.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 08:32:31 -0800 (PST)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1794328346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MuNXC0IJk19PvOjYjcF2JgzsmYbOOaLTEu3Iw97zbKY=;
 b=LOJ3bbFDctzKFIIJ/4q/BBjGKAdl6BMyuFRJu2yegjnFtW1Wlk5USfsy5gkK/vgo2IWCTh
 M8JG73BEoEL6hor4RlFDa8GeQvm3H3yKM6cwRaMwSbmPntxN36060r6YAD0aCyxJ/+b6li
 zXotUJHkgfLqTUIrg1Jisc4NPQTyBls=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id dde93f26
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 16:32:25 +0000 (UTC)
Date: Tue, 10 Nov 2026 17:32:24 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: =?utf-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH wireguard-tools v4 0/3] ipc: linux: kernel-side netdevice
 filtering
Message-ID: <avNHGIIOs5702an6@zx2c4.com>
References: <20260312214405.589127-1-ast@fiberby.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312214405.589127-1-ast@fiberby.net>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Mar 12, 2026 at 09:43:58PM +0000, Asbjørn Sloth Tønnesen wrote:
> Move device filtering to the kernel, thereby reducing netlink traffic.
> 
> The first patch request kernel-side filtering.
> 
> The second patch removes the old filtering code, as an
> additional step, which breaks on earlier than Linux v4.6.
> 
> The third patch requests that the kernel doesn't include statistics
> in netdevice dumps.
> 
> This bumps the minimum supported Linux kernel version to v4.6.

Sorry for the delay. Applied with one small cleanup:
https://git.zx2c4.com/wireguard-tools/commit/?id=522f583d5304f93f71a95b81870db5fe0a74cfd6

Thank you for this!

Jason
