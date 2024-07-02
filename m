Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF68D49228
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 14:53:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b3d00f0;
	Mon, 18 Nov 2024 12:45:23 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1c5d3082
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Jul 2024 10:02:00 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-70683d96d0eso2346885b3a.0
 for <wireguard@lists.zx2c4.com>; Tue, 02 Jul 2024 03:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719914517; x=1720519317; darn=lists.zx2c4.com;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hWiOatSR7mntr9mVVIU53E7W5KMWYRrHlhjpfe9lb/s=;
 b=dS4VrBlqZ4C7JOwIktfoIyzDq/fgBEELdZMoaKDas+89RE3CDo6VOZ3wVGxB1Zfh/d
 Gp5HOJ0cGM4KuW5ASSm/KKFcapw7HSlU5rARCdw63dn+1Mr8JZNTWMZdRIOTitGhui1W
 3VwlQ5YKaDCzDnU8fLAtBtH1YnKCj1kbh/qMdoilbHYfMOaw4fwEfF0t0moJZ7dGb44H
 LDW92OCexuDP8/gwTOnIHdhfs3yWN30G/iq84vtnfC2UKI31xB4EPipvqmdKU5tYn3QT
 Q9fGXde9pRWQwdr3NZmkJq3E1YfrmWE9v83mci9oR6V3tU4iB8lk1+g/x6hX61lTUSmf
 24Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719914517; x=1720519317;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hWiOatSR7mntr9mVVIU53E7W5KMWYRrHlhjpfe9lb/s=;
 b=LxBh0RJ97FavhB/vtiDqO8ped4WBgEtHwsGhBkt1Sw+ypis7PPUpYxwFAaj5w0uy7+
 OiS7uq2igEqUAnPdqDMPxojNARW9EWtknXEvi4Sxe6c1sT4SYRr9R9/rivp2mKdPF+n5
 n5NLJ2r+L59SXvZ9WaO9u3EsBobBzaHBPsnS7i5dvYJsI2zFvrHP/foffbpaax/XZoVj
 kvZXZTQrcDP3rwW+G+J5NOGN5ccLi87Iempj/ziKkImEq1oj70tsh+ZNByG6Uv4AiZF4
 KbmK4DY/Kd+BnBJkaCW7vDtzrW1rZH+2pXUJmPez3mySN+Dt+ve6U8JDaSHGXH5OrewY
 G5MQ==
X-Gm-Message-State: AOJu0YzOUKZylEQn50IwUicRxlkPKZGcSHC+gQlZbLHF2hp4NcGtKLVI
 gstapVF7veCrWKKBh8jPkz7a5p0hyQWNqUDT8mWagAkoCLhEp0zSpiRNbA==
X-Google-Smtp-Source: AGHT+IEXEdeXQBkVmxNqE9BNTE9XbEEHlc9NtlAHlMULAhQ8I4ET9yHLdy+8AaPnWOJUdI0rpOAn1g==
X-Received: by 2002:a05:6a20:840e:b0:1be:c2f7:275 with SMTP id
 adf61e73a8af0-1bef6245512mr7381572637.50.1719914517285; 
 Tue, 02 Jul 2024 03:01:57 -0700 (PDT)
Received: from [192.168.188.101] (118-169-225-252.dynamic-ip.hinet.net.
 [118.169.225.252]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10e365asm82139655ad.86.2024.07.02.03.01.55
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 03:01:56 -0700 (PDT)
Message-ID: <caa99f73-6837-4ea4-b135-afc6a452101a@gmail.com>
Date: Tue, 2 Jul 2024 18:01:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: Loren Hsu <rdp.loren@gmail.com>
Subject: Hyper-V VM can't ping host when Wireguard is started in host
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

Hi List,
Here is an issue when the Wireguard is running on a Windows 11, the 
hyper-V VM can't access the host OS.

My laptop is running Windows 11 host OS, it has a hyper-V VM created and 
Ubuntu 22.04 LTS installed. When Wireguard is started on the Windows 11 
host machine, the Ubuntu can't ping the host OS, but it can ping any 
public IP, like 8.8.8.8.

The VM has only one virtual interface and is connected to a NAT-virtual 
switch. The NAT-vswitch has a VM-facing IP 192.168.188.1/24, while the 
IP in the VM is something like 192.168.188.10/24.

Here are some steps that have been taken to clarify this issue:
1. When the Wiregurad is NOT started in the host OS, the Ubuntu can ping 
the host as well as any public IP.
2. When the Wireguard is started, and capture network traces on the host 
for the 192.168.188.1 interface, the ping requests are seen coming from 
the VM, but no reply from the host.
3. from the 'route print' in the host, the 192.168.188.1/32 is there 
with metrics 271, which is the 2nd lowest metric that is only inferior 
to the default route, which is 40. But I guess the longest prefix should 
match first in this case, besides, the route print output looks the same 
with or without wireguard enabled.

It looks like a firewall issue, since network trace has echo requests 
from the VM, but it's not clear to me what settings should be changed, 
since the inbound icmp echo request is allowed already.

Any ideas are welcome.
Thanks,
Loren

