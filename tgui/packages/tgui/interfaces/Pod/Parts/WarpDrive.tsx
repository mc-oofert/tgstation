import { BooleanLike } from 'common/react';
import { useBackend } from '../../../backend';
import { Button, Box, Stack, Dropdown } from '../../../components';
import { DropdownEntry } from '../../../components/Dropdown';

type Data = {
  mayWarp: BooleanLike;
  warpPercentage: number;
  beacons: DropdownEntry[];
  selectedBeacon: DropdownEntry;
  partUIData: string[];
};

export default function WarpDrive(_props: any): JSX.Element {
  const { act, data } = useBackend<{
    partUIData: string[];
    ourData: Data;
  }>();
  const { partUIData } = data;
  const ourData = partUIData['WarpDrive'];
  return (
    <>
      <Stack>
        <Stack.Item width="60%">
          <Stack vertical>
            <Stack.Item>
              <Dropdown
                width="100%"
                options={ourData.beacons}
                selected={ourData.selectedBeacon}
                onSelected={(value) =>
                  act('set_warp_target', {
                    partID: 'WarpDrive',
                    target: value,
                  })
                }
              ></Dropdown>
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item>
              <Box color={ourData.mayWarp ? 'green' : 'red'}>
                {ourData.mayWarp
                  ? 'You may warp and it will consume ' +
                    ourData.warpPercentage +
                    '% charge.'
                  : 'Cant warp right now. Select a beacon and make sure you are not moving and have atleast ' +
                    ourData.warpPercentage +
                    '% charge.'}
              </Box>
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Divider />
        <Stack.Item>
          <Button
            circular
            height={8}
            width={8}
            onClick={() => act('warp', { partID: 'WarpDrive' })}
            disabled={!ourData.mayWarp}
            color={ourData.mayWarp ? 'red' : 'grey'}
          >
            <Box fontSize="24px" mt={6} ml={1}>
              WARP
            </Box>
          </Button>
        </Stack.Item>
      </Stack>
    </>
  );
}
