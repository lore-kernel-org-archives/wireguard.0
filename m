Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8923606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Oct 2026 22:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lfi+GLS+
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d04cb9b1;
	Fri, 23 Oct 2026 22:58:44 +0000 (UTC)
Received: from mail-qv1-xf65.google.com (mail-qv1-xf65.google.com
 [2607:f8b0:4864:20::f65])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fd82ffe9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Oct 2026 22:58:41 +0000 (UTC)
Received: by mail-qv1-xf65.google.com with SMTP id
 6a1803df08f44-91befbcad6dso21984486d6.3
 for <wireguard@lists.zx2c4.com>; Fri, 23 Oct 2026 15:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792796320; x=1793401120;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:dkim-signature
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=GXq36bGT56R0FtfZYg21vEMJLEvNtTHRRADz5kWWrLQ=;
 b=gsACooP+dswxPyUvGCFWyN1+4v9sb/VPT4FItwASDSqiNyfDDvGbrbrOmSr6ZXrOyY
 1DJRkmv0Ql7KBmeJsXLqKI6mzqZoo5jrp2/zU3gTwpBhonXtk7oAoUK8ODQ5NtpbiJZK
 JWzccrHH81KvV5b2RyUCeNGRCKjevqgr1+PO3ahQYt71k20Pw40XsU4fPKKo7O/mQ+XW
 ru14DCfvHBlWzTeacwirZMvsVD9OJKVJ21nA9AhNC8ik3dYh2SlcRrGLiCapL9ZjXJQP
 Gbo21o+ooGnhAJaGsQWQfa5gi1QKvbQmmXjpU4+91LMvsaAODGJq1cQeIOuZEEiLrCgV
 aCVw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwuTvk5ogHBA6wzIqaqW9Fd6xfPpcWpkFDZSe834iwL4PRjKc4rM+iY7BlxoOrDmfKSEJGHPwFbzko=@lists.zx2c4.com
X-Gm-Message-State: AFq9FYKofGfgq68NZEORB4XVu7JFlm12uzhWGKU2SZp1TR2Naf2qaqZk
 Sp5DGRSa947UCbwtGZtUQHPp1k3CXnGPjqrEjb9yV8759UZXa3sxuVCh1KXBbjFgfFVRVQwMzRA
 MrJUa/U6Z5XrPvuP05HXa6Rmr4ohPyqyq99yx3J56cg==
X-Gm-Gg: AYBFou2NWFZWv8IA9CNXoPN3ZTDz3dVD2NUO+BUNqEWGzFb8xRs5xKQIzCNMxU6eeFI
 A/zKZgk+D1vEgwNsMbQpAS/6G8Kon83ChncRWtHXHJBE/a0y3gpDjIf4YcOce+eHEoGpaR4WZ7Z
 +aNgZSmS/PEKL5xGEFNKDAEXExiuHhqHQ9XRviRcsj4b/HNJWbA+tKj15SBBI4kMe/uaHDvTKHy
 cgOGwXvP836+PDiqVq1UABiTAcCePXEC3k92kPo0NGEDGSVXEPVGOJdk7OwV6b4AJe/aTT37yJ4
 hnX6VE0qI+kjGVikg8U0To5LbG17Up00C3p0+IrwH7DaShteHZSbPq9owdttZJVMJFWDuXa45C/
 F7g==
X-Received: by 2002:a05:620a:2b83:b0:93e:fcc0:6946 with SMTP id
 af79cd13be357-940ef9956e6mr69346985a.57.1792796320157; 
 Fri, 23 Oct 2026 15:58:40 -0700 (PDT)
Received: from zx2c4.com (mail.zx2c4.com. [104.131.123.232])
 by smtp-relay.gmail.com with ESMTPS id
 af79cd13be357-940f0677243sm5398185a.9.2026.10.23.15.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 15:58:40 -0700 (PDT)
X-Relaying-Domain: zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1792796316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GXq36bGT56R0FtfZYg21vEMJLEvNtTHRRADz5kWWrLQ=;
 b=lfi+GLS+HJ7/ndNJuguo5ZIBDDw5UULREIbw+CJrFiz64K/0fU1/TFJ/34Q75IwuEouyp9
 FKppIkrJNnU1TN87aIbUGj4NeftOebukNVtCAEC4jppoe40x0wxvbbKSBDbsGndtwDIbCt
 yjmQDbdtkQbaoUhANyoG9+7ZLGSAmFU=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 01d9b725
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 23 Oct 2026 22:58:35 +0000 (UTC)
Date: Sat, 24 Oct 2026 00:58:26 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: pasichdev <apasichnik9@gmail.com>
Cc: netdev@vger.kernel.org, wireguard@lists.zx2c4.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net] wireguard: peer: free packets left on the per-peer
 queues on removal
Message-ID: <atvmkkF3UQMhvv3U@zx2c4.com>
References: <20261003201625.4572-1-apasichnik9@gmail.com>
 <20261023211626.99784-1-apasichnik9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023211626.99784-1-apasichnik9@gmail.com>
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

On Sat, Oct 24, 2026 at 12:16:26AM +0300, pasichdev wrote:
> From: Andrii Pasichnyk <apasichnik9@gmail.com>
> 
> Hi Jason,
> 
> Gentle ping on this one. Patchwork shows it as awaiting upstream, so I
> assume it should go through your tree. It still applies to net and
> net-next unchanged; if you would rather have it taken through net
> directly, or want anything changed, please let me know.

Thanks for the poke. I got bogged down with some other wireguard patches
and this slipped past. I'll take a look in the coming week.

Jason
