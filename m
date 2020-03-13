Return-Path: <SRS0=1fcv=46=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8469C10DCE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Mar 2020 23:47:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7CD20637
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Mar 2020 23:47:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxK8Gp0Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B7CD20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77770324;
	Fri, 13 Mar 2020 23:41:14 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2048ed81
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Mar 2020 14:46:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 6so10280930wmi.5
 for <wireguard@lists.zx2c4.com>; Fri, 13 Mar 2020 07:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:reply-to:to:date:mime-version
 :content-transfer-encoding;
 bh=v1szxgysHKJ2pocZKCthYuypy7V3GCCmrdlZoavqpnI=;
 b=UxK8Gp0YgHyxfZuGRI1n1SuFqXpXS9fxwnqbDyCmdcKaHiQkrRXt9Yo/pZWMVG/dK+
 2BhQ3JwhtwBIzALXRXcnm+MCJsW+yOnWeA9Z2omylCyzxRcUbP0i3l8dxY9G4KkUh2lM
 FZNiXCBuFiZPc3oIFj24CKUM9nn8ZbiEA1SRQ5aWadyd/C6TxwNYdu0xUby9H2j70IMZ
 BYwpkVu/1VziJ8l484hWuioqbSYtb9XRkgzSOSv/nbIiyw0QVKYgSuQxCLlBhcoQZuT8
 PHlQnvACwNZHePbFRWkjUMQ7Ce4P6eLqLKpKmoSvz0ZaNWJrQUNZsxVoKBitr3mUuALh
 IYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :mime-version:content-transfer-encoding;
 bh=v1szxgysHKJ2pocZKCthYuypy7V3GCCmrdlZoavqpnI=;
 b=dOgrO7aC7vnCoEYJ2oIV7dyUuldUCIBZLBPA5qOwiX3+k44W0J3tHOZpoEyJkT+n27
 QYW9qrKb7gzDo3b6pVA5cthTMxtkzZ/3A9RNsLPM++Q0MVx6weefpj8VTvtpNnGnhg+B
 /Kzkx8WfjGPuum1ZxEpdNdc/C/1SuLnhnP5y2OxGGp0/3ythVFreI9Ji4E7VW3RvQBrz
 b1pu8bJ0ska8Cl5gk2zLjqEXJP2YNUuUaoctmMs8msnLLarrpuWd+MU7qUtBixDhscc1
 6IKzNBHO0UGxYcUfQc40AiYxvlg1L56+G2ZGipXE007BvAYwBfMKDntiOkQ0sxnquNnP
 TWjQ==
X-Gm-Message-State: ANhLgQ0/vroi9aIJiQdmQwvXOq16IUkky7X1yFFAsgIRIrD3kj5ieCoH
 LAGRIrR9XR6RhUBY9CfeunUb3P0u
X-Google-Smtp-Source: ADFU+vugpruZOboKqKrhSYrY/cLXPuA7tLVrGR2TfuF5EaXyIjIhgySt0oCLQ5STYwn67XdBWBNb1A==
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr11676984wmc.134.1584111140795; 
 Fri, 13 Mar 2020 07:52:20 -0700 (PDT)
Received: from torstenknbl.mgm-edv.de ([185.40.248.10])
 by smtp.googlemail.com with ESMTPSA id z19sm17860743wma.41.2020.03.13.07.52.19
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 13 Mar 2020 07:52:19 -0700 (PDT)
Message-ID: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
Subject: Endpoint address dns resolution - option to prefer IPv6 or IPv4
From: Torsten Krah <krah.tm@gmail.com>
To: wireguard@lists.zx2c4.com
Date: Fri, 13 Mar 2020 15:52:19 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 14 Mar 2020 00:41:13 +0100
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
Reply-To: krah.tm@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

I've got an endpoint with a DNS name which has both, an A and AAAA
record.
I would like to configure the client, so that I can tell him, to either
prefer IPv6 or IPv4 for the vpn connection.

How can I do that (no I don't want to remove either an A or AAAA record
from DNS - just in the client)?

If its not yet possible -  can support be added for this? I am also
happy with some code pointers where this decision is done to come up
with a patch maybe?

kind regards

Torsten


