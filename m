Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812C2CF2562
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 22:44:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1d08f1b;
	Tue, 18 Nov 2025 17:26:28 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cdc7bf20
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Sep 2025 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757169109;
 bh=nPtolzUUdlCUaSNkIVdfvaVv8xRgd3T2+hMojv5OFwM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lCHXOKET/sMYecAcLRWWSOJthU2boxTzWWGDVH2KhgusrErXQsLJQNpUP6ZF9J7aD
 60nXSmju64g/ga/0A2Qt4Q3lj/eNJcHbPwKh0X0cMDjNvdSA/asrDJozK6xgo1hPU+
 LN2ROUhWOvA8r+xFctiFaImzVE4ByXYiK1gISPVSrkaMwB9yjc/KgTf0RckeEoT8Ur
 6Te80cyYeluLgr78r9g6uALlZatoVsabqk7WA9D41RSZtZNuRI0YP+APAj0zEdLvBG
 CRcd3vbpcLqW1JtFjtKZvwTlN1sd5G0tbpsH9F3MBZnZvkz9gHiLZ65j4PsV53CBLw
 PyagK+Oy1UVFQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 367586000C;
 Sat,  6 Sep 2025 14:31:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by x201s (Postfix) with ESMTP id ED8E1200438;
 Sat, 06 Sep 2025 14:31:44 +0000 (UTC)
Message-ID: <bf530a9a-dca8-4df7-b9f2-9f2b3a1d2ce1@fiberby.net>
Date: Sat, 6 Sep 2025 14:31:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/11] tools: ynl: decode hex input
To: Jacob Keller <jacob.e.keller@intel.com>,
 Donald Hunter <donald.hunter@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250904-wg-ynl-prep@fiberby.net>
 <20250904220156.1006541-10-ast@fiberby.net> <m2h5xhxjd5.fsf@gmail.com>
 <410d69e5-d1f8-40e0-84b1-b5d56e0d9366@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Asbj=C3=B8rn_Sloth_T=C3=B8nnesen?= <ast@fiberby.net>
In-Reply-To: <410d69e5-d1f8-40e0-84b1-b5d56e0d9366@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:15 +0000
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

On 9/6/25 12:27 AM, Jacob Keller wrote:
> On 9/5/2025 3:51 AM, Donald Hunter wrote:
>> Asbjørn Sloth Tønnesen <ast@fiberby.net> writes:
>>
>>> This patch add support for decoding hex input, so
>>> that binary attributes can be read through --json.
>>>
>>> Example (using future wireguard.yaml):
>>>   $ sudo ./tools/net/ynl/pyynl/cli.py --family wireguard \
>>>     --do set-device --json '{"ifindex":3,
>>>       "private-key":"2a ae 6c 35 c9 4f cf <... to 32 bytes>"}'
>>>
>>> Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
>>
>> Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
>>
>> FWIW, the hex can include spaces or not when using bytes.fromhex(). When
>> formatting hex for output, I chose to include spaces, but I don't really
>> know if that was a good choice or not.
> 
> I also prefer the spaces for readability.
I formatted it with spaces for clarity, even without spaces it was a bit
long for one line. Spaces also has the advantage that you don't have to
think about endianness.

Should we define the display hints a bit more in a .rst, or is it OK that
they end up being implementation specific for each language library? Do we
want them to behave the same in a Rust YNL library, as they do in Python?

BTW: The rest of the key used in the example can be found with this key-gen:
$ printf "hello world" | sha1sum
[redacted key material]
